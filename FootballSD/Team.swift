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
    var startsAt: Date
    
    init?(id: Int, name: String, logo: UIImage?, startsAt: Date) {
        self.id = id
        self.name = name
        self.logo = logo
        self.startsAt = startsAt
    }
}
