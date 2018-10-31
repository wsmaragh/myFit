//
//  OnboardingVC.swift
//  Fit
//
//  Created by C4Q on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import AVFoundation


class LandingVC: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var slideScrollView: UIScrollView!
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var joinButton: UIButton!
    
	private var slides = [UIView]()
	private var slideIndex = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		//			AuthUserService.manager.signOut()
        navigationController?.navigationBar.isHidden = true
        slideScrollView.delegate = self
        slides = createSlides()
        addSlidesToScrollView(slides: slides)
        setupPageControl()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeSlide), userInfo: nil, repeats: true)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(false)
		setupAndPlayVideoBackground()
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.isNavigationBarHidden = false
	}

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
	@objc func changeSlide() {
		slideIndex += 1
		if slideIndex < self.slides.count {
			slideScrollView.scrollRectToVisible(slides[slideIndex].frame, animated: true)
		}
		else {
			slideIndex = 0
			slideScrollView.scrollRectToVisible(slides[slideIndex].frame, animated: true)
		}
	}

    func createSlides() -> [UIView] {
        let slide1 = OnboardingSlide(title: "Bond over Workout", details: "Start with a simple meal and build from there.", picture: #imageLiteral(resourceName: "bgOnBars"))
        let slide2 = OnboardingSlide(title: "Companionship", details: "Why eat alone, when you can also meet your soulmate", picture: #imageLiteral(resourceName: "workout5"))
        let slide3 = OnboardingSlide(title: "Plan a Workout in app", details: "Exploring new workouts...", picture: #imageLiteral(resourceName: "workout4"))
        return [slide1, slide2, slide3]
    }

	func addSlidesToScrollView(slides: [UIView]) {
		slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: slideScrollView.bounds.height)
		slideScrollView.isPagingEnabled = true
		slideScrollView.isDirectionalLockEnabled = true
		for i in 0..<slides.count {
			slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
			slideScrollView.addSubview(slides[i])
		}
	}
    
    func setupPageControl(){
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let currentPage = scrollView.contentOffset.x / scrollView.frame.size.width
		pageControl.currentPage = Int(currentPage)
		slideIndex = pageControl.currentPage
	}

	func setupAndPlayVideoBackground() {
		guard let videoURL = Bundle.main.url(forResource: "shoes", withExtension: "mp4") else {return}

		let shade = UIView(frame: self.view.frame)
		shade.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
		view.addSubview(shade)
		view.sendSubviewToBack(shade)

		var avPlayer = AVPlayer()
		avPlayer = AVPlayer(url: videoURL)
		let avPlayerLayer = AVPlayerLayer(player: avPlayer)
		avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
		avPlayer.volume = 0
		avPlayer.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
		avPlayerLayer.frame = view.layer.bounds

		let layer = UIView(frame: self.view.frame)
		view.backgroundColor = UIColor.clear
		view.layer.insertSublayer(avPlayerLayer, at: 0)
		view.addSubview(layer)
		view.sendSubviewToBack(layer)

		NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishedPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)

		avPlayer.play()
	}

	@objc func playerDidFinishedPlaying(notification: NSNotification) {
		if let player = notification.object as? AVPlayerItem {
			player.seek(to: CMTime.zero, completionHandler: nil)
		}
	}

}
