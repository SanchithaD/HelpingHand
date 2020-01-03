//
//  TwoGripVideoPlayerViewController.swift
//  HelpingHand
//
//  Created by Vaishnavi Kunapuli on 4/19/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

// Plays video on GripViewController
class GripVideoPickerViewController: UIViewController {
    
    var videoPath: String = ""

    @IBAction func rightButtonClick(_ sender: Any) {
        videoPath = "RightHand"
    }

    @IBAction func leftButtonClick(_ sender: Any) {
        videoPath = "LeftHand"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gripVideoPlayerController = segue.destination as? GripVideoPlayerViewController else {
            return
        }
        let button = sender as? UIButton
        if button?.tag == 0 {
            gripVideoPlayerController.gripVideoPath = "RightHand"
        } else {
            gripVideoPlayerController.gripVideoPath = "LeftHand"
        }
        
    }
}

