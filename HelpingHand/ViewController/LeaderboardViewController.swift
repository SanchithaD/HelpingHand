//
//  LeaderboardViewController.swift
//  HelpingHand
//
//  Created by Sarasvati Bhat on 4/17/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import Foundation
import UIKit

struct RankCell {
    var id : Int
    var name : String
    var points : String
}

class HeadlineTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
}

// creates a table view for the leaderboard
class LeaderBoardTableViewController: UITableViewController {
    
    var rankCellArray = [
        RankCell(id: 1, name: "Cassava", points: "225"),
        RankCell(id: 2, name: "Brianna709", points: "195"),
        RankCell(id: 3, name: "ArtyFischel", points: "175"),
        RankCell(id: 4, name: "alex_h", points: "160"),
        RankCell(id: 5, name: "sultanahmed-0412", points: "145"),
        RankCell(id: 6, name: "eileendover", points: "130"),
        RankCell(id: 7, name: "adrianj", points: "125"),
        RankCell(id: 8, name: "Ben582", points: "120" ),
        RankCell(id: 9, name: "iluvcats1738", points: "110"),
        RankCell(id: 10, name: "johnnypapa32", points: "95"),        ]
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankCellArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankTableViewCell", for: indexPath) as! HeadlineTableViewCell
        let rankCell = rankCellArray[indexPath.row]
        cell.pointsLabel?.text = rankCell.name
        cell.nameLabel?.text = rankCell.points
        return cell
    }
    
}
