//
//  JoinVC.swift
//  Fit
//
//  Created by Winston Maragh on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class JoinVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
//    private var slides: [UIView] = [JoinBio(), JoinHabits(), JoinFinal()]
    private var slideIndex = 0
    private var numOfSlides: Int = 3
    

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.delegate = self
//        view.addSubview(joinBioView)
//        addSlidesToScrollView(slides: slides)

    }


//    {
//        print("Worked")
//
////        .loadNibNamed("JoinBio", owner: self, options: nil)?.first as? JoinBio {
////        scrollView.addSubview(view1)
//    } else {
//    print("Failed")
//    }
    
    
	@IBAction func dismissView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)        
	}
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / scrollView.frame.size.width
        slideIndex = Int(currentPage)
    }
    
//    @objc func changeSlide() {
//        slideIndex += 1
//        if slideIndex < self.slides.count {
//            slideScrollView.scrollRectToVisible(slides[slideIndex].frame, animated: true)
//        }
//        else {
//            slideIndex = 0
//            slideScrollView.scrollRectToVisible(slides[slideIndex].frame, animated: true)
//        }
//    }
    
//    override func awakeFromNib() {
//
//
//        self.scrollView.contentSize = joinBio.frame.size
//        self.scrollView.addSubview(joinBio)
//        return;
//    }
    
    
    func addSlidesToScrollView(slides: [UIView]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollView.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.isDirectionalLockEnabled = true
        
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    

}
