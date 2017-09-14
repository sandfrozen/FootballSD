//
//  Team.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Team: NSObject {
    var id: Int
    var name: String
    var logo: UIImage?
    var startsAt: String
    
    init(id: Int, name: String, logo: UIImage, startsAt: String) {
        self.id = id
        self.name = name
        self.logo = logo
        self.startsAt = DateFormatter.polishFormat(string: startsAt)
    }
    
    convenience init?(teamInArray: [String: AnyObject]) {
        
        guard let id = teamInArray["team_id"] as? Int else {
            os_log("Unable to decode the id from Team JSON for a Team object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let name = teamInArray["team_name"] as? String else {
            os_log("Unable to decode the team_name from Team JSON for a Team object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let logoString = teamInArray["team_logo"] as? String else {
            os_log("Unable to decode the team_logo from Team JSON for a Team object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let logoUrl = URL(string: "https://"+logoString)!
        let logo = try! UIImage(withContentsOfUrl: logoUrl)
        
        guard let startsAt = teamInArray["starts_at"] as? String else {
            os_log("Unable to decode the starts_at from Team JSON for a Team object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(id: id, name: name, logo: logo!, startsAt: startsAt)
        
//        self.id = id
//        self.name = name
//        self.logo = logo
//        self.startsAt = DateFormatter.polishFormat(string: startsAt)
    }
}

extension UIImage {
    
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        
        self.init(data: imageData)
    }
    
}
