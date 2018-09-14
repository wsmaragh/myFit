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
//        slideScrollView.delegate = self
//        slides = createSlides()
//        addSlidesToScrollView(slides: slides)
//        setupPageControl()
//        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeSlide), userInfo: nil, repeats: true)
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
//        let slide1 = WelcomeLogoSlide()
        let slide2 = OnboardingSlide(title: "Bond over Workout", details: "Start with a simple meal and build from there.", picture: #imageLiteral(resourceName: "fullChart"))
        let slide3 = OnboardingSlide(title: "Companionship", details: "Why eat alone, when you can also meet your soulmate", picture: #imageLiteral(resourceName: "lowerChart"))
        let slide4 = OnboardingSlide(title: "Plan a Workout in app", details: "Exploring new workouts...", picture: #imageLiteral(resourceName: "coreChart"))
        return [slide2, slide3, slide4]
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
        view.bringSubview(toFront: pageControl)
    }

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let currentPage = scrollView.contentOffset.x / scrollView.frame.size.width
		pageControl.currentPage = Int(currentPage)
		slideIndex = pageControl.currentPage
	}


	// MARK: Background Video Player
	func setupAndPlayVideoBackground() {
		//video URL
		guard let videoURL = Bundle.main.url(forResource: "shoes", withExtension: "mp4") else {return}

		//Shade
		let shade = UIView(frame: self.view.frame)
		shade.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
		view.addSubview(shade)
		view.sendSubview(toBack: shade)

		//AV Player
		var avPlayer = AVPlayer()
		avPlayer = AVPlayer(url: videoURL)
		let avPlayerLayer = AVPlayerLayer(player: avPlayer)
		avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
		avPlayer.volume = 0
		avPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.none
		avPlayerLayer.frame = view.layer.bounds

		//UIView Layer for Video
		let layer = UIView(frame: self.view.frame)
		view.backgroundColor = UIColor.clear
		view.layer.insertSublayer(avPlayerLayer, at: 0)
		view.addSubview(layer)
		view.sendSubview(toBack: layer)

		//Notification
		NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishedPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)

		//Play video
		avPlayer.play()
	}

	@objc func playerDidFinishedPlaying(notification: NSNotification) {
		if let player = notification.object as? AVPlayerItem {
			player.seek(to: kCMTimeZero, completionHandler: nil)
		}
	}

}



