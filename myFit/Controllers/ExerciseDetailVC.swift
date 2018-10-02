//
//  ExerciseVC.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import AVFoundation


class ExerciseDetailVC: UIViewController {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //var viewModel: DetailExerciseViewModel!
    
    var exercise: Exercise!
    
    var player: AVPlayer!
    var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = exercise.name
        setupVideoView()
    }
    
    deinit {
        print("de-init: DetailExerciseVC - memory cleared")
    }
    
    func setupVideoView(){
        addVideoToViewView()
        addPlayButtonToVideoView()
        addTapGesture()
    }
    
    func addVideoToViewView(){
        print("EXERCISE videoStr", exercise.videoStr)

        guard let videoURL = Bundle.main.url(forResource: "abs", withExtension: "mp4") else {
            print("Error with video");
            return
        }
//        guard let videoURL = Bundle.main.url(forResource: exercise.videoStr, withExtension: "mp4") else {print("Error with video"); return}
        self.player = AVPlayer(url: videoURL)
        player?.volume = 0.001
        let layer: AVPlayerLayer = AVPlayerLayer(player: player)
        //layer.frame = videoView.bounds
        layer.frame = CGRect(x: 20, y: 0, width: videoView.layer.bounds.width, height: videoView.layer.bounds.height)
        layer.videoGravity = AVLayerVideoGravity.resize
        videoView.layer.addSublayer(layer)
    }
    
    func addPlayButtonToVideoView(){
        let size: CGFloat = 100.0
        playButton = UIButton(frame: CGRect(x:
            (videoView.bounds.size.width / 2) - (size/2), y: (videoView.bounds.size.height / 2) - (size/2), width: size, height: size))
        playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        playButton.setImage(#imageLiteral(resourceName: "button_playVideo"), for: .normal)
        playButton.backgroundColor = .clear
        playButton.layer.opacity = 0.6
        videoView.addSubview(playButton)
    }
    
    private func addTapGesture(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pauseVideo))
        self.videoView.addGestureRecognizer(tap)
    }
    
    @objc private func playPressed(){
        player?.play()
        playButton.isHidden = true
    }
    
    @objc private func pauseVideo(){
        player?.pause()        
        playButton.isHidden = false
    }
    
    @IBAction func playVideoButtonTapped(_ sender: UIButton) {
        player?.play()
    }
    
}
