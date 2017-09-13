//
//  Player.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation
import UIKit

class Player {
    var id: Int
    var name: String
    var age: Int
    var birth: Date
    var country: String
    var height: Int
    var weight: Int
    var shirtNumber: Int
    var position: String
    var lineupPosition: Int
    var lineupDesc: String
    var pointsAvg: Int
    var myPoints: Int
    var photoUrl: URL
    
    init(id: Int, name: String, age: Int, birth:Date, country: String, height: Int, weight: Int, shirtNumber: Int, position: String, lineupPosition: Int, lineupDesc: String, pointsAvg: Int, myPoints: Int, photoUrl: URL) {
        self.id = id
        self.name = name
        self.age = age
        self.birth = birth
        self.country = country
        self.height = height
        self.weight = weight
        self.shirtNumber = shirtNumber
        self.position = position
        self.lineupPosition = lineupPosition
        self.lineupDesc = lineupDesc
        self.pointsAvg = pointsAvg
        self.myPoints = myPoints
        self.photoUrl = photoUrl
    }
}
