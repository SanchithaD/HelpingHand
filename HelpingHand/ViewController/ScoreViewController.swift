//
//  ScoreViewController.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/8/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import UIKit

// ScoreViewController shows encouragment to the user
class ScoreViewController: UIViewController {
    
    @IBOutlet weak var starImageView: UIImageView!

    @IBAction func goHome(_ sender: UIBarButtonItem) {
      navigationController?.popToRootViewController(animated: false)
    }

    // Pops to the levels view controller
    @IBAction func levels(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LevelsViewController.self) {
                self.navigationController!.popToViewController(controller, animated: false)
                break
            }
        }
    }

    override func viewDidLoad() {
        // spin animation for the star
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue =  Double.pi * 2.0
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        starImageView.layer.add(animation, forKey: "spin")
    }
}
