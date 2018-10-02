//
//  JoinVC.swift
//  Fit
//
//  Created by Winston Maragh on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class JoinVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    deinit {
        
    }
    
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

    
	@IBAction func dismissView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)        
	}
    
    
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



extension JoinVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / scrollView.frame.size.width
        slideIndex = Int(currentPage)
    }
    
}
