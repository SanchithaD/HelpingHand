//
//  GripVideoPlayerViewController.swift
//  HelpingHand
//
//  Created by Vaishnavi Kunapuli on 4/19/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

// GripVideoPlayerViewController shows videos on how to hold the pencil properly
class GripVideoPlayerViewController: UIViewController {
    
    // plays video on AV View Controller
    var gripVideoPath: String = ""
    override func viewDidLoad() {
        guard let videoPath = Bundle.main.path(forResource: gripVideoPath, ofType:"MOV") else {
            debugPrint(gripVideoPath, "not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: videoPath))
        
        let avPayerController = AVPlayerViewController()
        avPayerController.player = player
        avPayerController.view.frame = self.view.frame
        self.addChild(avPayerController)
        self.view.addSubview(avPayerController.view)
        //let playerController = AVPlayerViewController()
        player.play()
        
    }
}
