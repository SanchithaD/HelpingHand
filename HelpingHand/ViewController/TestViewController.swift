//
//  TestViewController.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/18/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import UIKit

// The TestViewController detects what letter the user draws, and gives them points based on that
class TestViewController: UIViewController {
    
    var rawPoints:[Int] = []
    var recognizer:DBPathRecognizer?
    var pointValue = 0

    @IBOutlet var renderView: RenderView!
    
    @IBOutlet var letterLabel: UILabel!
    override func viewDidLoad() {

        //define the number of directions of PathModel
        let recognizer = DBPathRecognizer(sliceCount: 8, deltaMove: 16.0)
        
        //define specific formes to draw on PathModel
        recognizer.addModel(PathModel(directions: [2,6,0,1,2,3,4,0,1,2,3,4], datas:"Beautiful Letter B!" as AnyObject))
        recognizer.addModel(PathModel(directions: [4,3,2,1,0], datas:"Charming Letter C!" as AnyObject))
        recognizer.addModel(PathModel(directions: [4,3,2,1,0,7,6,5,0], datas:"Great Letter G!" as AnyObject))
        recognizer.addModel(PathModel(directions: [2], datas:"Impressive Letter I!" as AnyObject))
        recognizer.addModel(PathModel(directions: [2,3,4], datas:"Jawdropping letter J!" as AnyObject))
        recognizer.addModel(PathModel(directions: [2,0], datas:"What a lovely letter L!" as AnyObject))
        recognizer.addModel(PathModel(directions: [6,1,7,2], datas:"Marvelous letter M!" as AnyObject))
        recognizer.addModel(PathModel(directions: [6,1,6], datas:"Neat Letter N!" as AnyObject))
        recognizer.addModel(PathModel(directions: [4,3,2,1,0,7,6,5,4], datas:"Outstanding letter O!" as AnyObject))
        recognizer.addModel(PathModel(directions: [6,7,0,1,2,3,4], datas: "Perfect letter P!" as AnyObject))
        recognizer.addModel(PathModel(directions: [2,6,7,0,1,2,3,4,1], datas:"Rocking letter R!" as AnyObject))
        recognizer.addModel(PathModel(directions: [4,3,2,1,0,1,2,3,4], datas:"Super letter S!" as AnyObject))
        recognizer.addModel(PathModel(directions: [1,7,0], datas:"Very nice letter V!" as AnyObject))
        recognizer.addModel(PathModel(directions: [2,7,1,6], datas:"Wonderful letter W" as AnyObject))
        recognizer.addModel(PathModel(directions: [0,3,0], datas:"Z" as AnyObject))
        self.recognizer = recognizer

        self.navigationItem.title = "The Test"
        
        //gets points for user
        let defaults = UserDefaults.standard
        if let userName = defaults.string(forKey: "user") {
            let userNamePoints = userName+"Points"
            pointValue = defaults.integer(forKey: userNamePoints)
            pointValueString.text = "\(pointValue)"
        } else {
            let userNamePoints = "Points"
            pointValue = defaults.integer(forKey: userNamePoints)
            pointValueString.text = "\(pointValue)"
        }

        super.viewDidLoad()
        
    }
    
    //takes the coordinates of the first touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rawPoints = []
        let touch = touches.first
        let location = touch!.location(in: view)
        rawPoints.append(Int(location.x))
        rawPoints.append(Int(location.y))
    }
    
    //takes all coordinates if touch moves
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let location = touch!.location(in: view)
        if(rawPoints[rawPoints.count-2] != Int(location.x) && rawPoints[rawPoints.count-1] != Int(location.y)) {
            rawPoints.append(Int(location.x))
            rawPoints.append(Int(location.y))
        }
        self.renderView.pointsToDraw = rawPoints
    }
    
    // changes the label based on the user's drawing
    @IBOutlet weak var pointValueString: UILabel!

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var path:Path = Path()
        path.addPointFromRaw(rawPoints)

        let gesture:PathModel? = self.recognizer!.recognizePath(path)

        if gesture != nil {
            let letters = gesture!.datas as? String
            letterLabel.text = letters
            pointValue = pointValue + 5
            pointValueString.text = "\(pointValue)"
        } else {
            letterLabel.text = "Oops. Try again"
        }

        //Set points to user
        let defaults = UserDefaults.standard
        if let userName = defaults.string(forKey: "user") {
            let userNamePoints = userName+"Points"
            let defaults = UserDefaults.standard
            defaults.set(pointValue, forKey: userNamePoints)
        } else {
            let userNamePoints = "Points"
            let defaults = UserDefaults.standard
            defaults.set(pointValue, forKey: userNamePoints)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //clears screen when you click on clear button
    @IBAction func clear(_ sender: UIBarButtonItem) {
        renderView.pointsToDraw = []
    }
}
