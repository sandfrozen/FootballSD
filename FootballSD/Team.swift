//
//  Team.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation
import UIKit

class Team: NSObject {
    var id: Int
    var name: String
    var logo: UIImage?
    var startsAt: String
    
    init?(id: Int, name: String, logo: UIImage?, startsAt: String) {
        self.id = id
        self.name = name
        self.logo = logo
        
        let dateString = startsAt
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dateFromString = formatter.date(from: dateString)
        formatter.dateFormat = "dd-MM-yyyy, HH:mm"
  
        self.startsAt = formatter.string(from: dateFromString!)
    }
}
