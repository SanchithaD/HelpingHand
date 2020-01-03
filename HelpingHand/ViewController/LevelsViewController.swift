//
//  LevelsViewController.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 2/23/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import UIKit
import UIKit
import CoreText

// The LevelsViewController holds the buttons for all the alphabet levels
class LevelsViewController: UIViewController {
    
    var backgroundLetterImage: UIImage?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DrawingCanvasViewController else {
            return
        }
        detailViewController.backgroundLetterImage = backgroundLetterImage
    }
    
    @IBAction func buttonBClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterB")
    }
    
    @IBAction func buttonCClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterC")
    }
    
    @IBAction func buttonGClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named: "LetterG")
        
    }
    
    @IBAction func buttonIClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterI")
    }
    
    @IBAction func buttonOClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterO")
        
    }
    
    @IBAction func buttonLClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterL")
    }
    
    @IBAction func buttonVClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterV")
    }
    
    @IBAction func buttonMClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterM")
    }
    
    @IBAction func buttonNClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named: "LetterN")
    }
    
    @IBAction func buttonPClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterP")
        
    }
    
    @IBAction func buttonJClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named: "LetterJ")
    }
    
    @IBAction func buttonRClick(_ sender: Any) {
        backgroundLetterImage = UIImage (named: "LetterR")
    }
    
    @IBAction func buttonSClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterS")
    }
    
    @IBAction func buttonUClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterU")
    }
    
    @IBAction func buttonWClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterW")
    }
    
    @IBAction func buttonZClick(_ sender: Any) {
        backgroundLetterImage = UIImage(named:"LetterZ")
    }
}
