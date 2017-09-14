//
//  Player.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Player {
    var id: Int
    var name: String
    var age: Int
    var birth: String
    var country: String
    var height: Int
    var weight: Int
    var shirtNumber: Int
    var position: String
    var lineupPosition: Int
    var lineupDesc: String
    var pointsAvg: Int
    var myPoints: Int
    var photo: UIImage
    
    init(id: Int, name: String, age: Int, birth: String, country: String, height: Int, weight: Int, shirtNumber: Int, position: String, lineupPosition: Int, lineupDesc: String, pointsAvg: Int, myPoints: Int, photo: UIImage) {
        self.id = id
        self.name = name
        self.age = age
        self.birth = DateFormatter.birthFormat(string: birth)
        self.country = country
        self.height = height
        self.weight = weight
        self.shirtNumber = shirtNumber
        self.position = position
        self.lineupPosition = lineupPosition
        self.lineupDesc = lineupDesc
        self.pointsAvg = pointsAvg
        self.myPoints = myPoints
        self.photo = photo
    }
    
    convenience init?(playerInArray: [String: AnyObject]) {
        
        guard let id = playerInArray["id"] as? Int else {
            os_log("Unable to decode the id from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let name = playerInArray["name"] as? String else {
            os_log("Unable to decode the name from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let age = playerInArray["age"] as? Int else {
            os_log("Unable to decode the age from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let birth = playerInArray["date_of_birth"] as? String else {
            os_log("Unable to decode the starts_at from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let country = playerInArray["country"] as? String else {
            os_log("Unable to decode the country from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let height = playerInArray["height"] as? Int else {
            os_log("Unable to decode the height from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let weight = playerInArray["weight"] as? Int else {
            os_log("Unable to decode the weight from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let shirtNumber = playerInArray["shirt_number"] as? Int else {
            os_log("Unable to decode the shirt_number from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let position = playerInArray["position"] as? String else {
            os_log("Unable to decode the position from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let lineupPosition = playerInArray["lineup_position"] as? Int else {
            os_log("Unable to decode the lineup_position from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let lineupDesc = playerInArray["lineup_desc"] as? String else {
            os_log("Unable to decode the lineup_desc from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let pointsAvg = playerInArray["points_avg"] as? Int else {
            os_log("Unable to decode the points_avg from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let mypoints = playerInArray["my_points"] as? Int else {
            os_log("Unable to decode the my_points from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let photoString = playerInArray["photo_url"] as? String else {
            os_log("Unable to decode the photo_url from Player JSON for a Player object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photoUrl = URL(string: "https://"+photoString)!
        let photo = try! UIImage(withContentsOfUrl: photoUrl)
        
        self.init(id: id, name: name, age: age, birth: birth, country: country, height: height, weight: weight, shirtNumber: shirtNumber, position: position, lineupPosition: lineupPosition, lineupDesc: lineupDesc, pointsAvg: pointsAvg, myPoints: mypoints, photo: photo!)
    }
}
