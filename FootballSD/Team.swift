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
    
    init?(teamInArray: [String: AnyObject]) {
        
        guard let id = teamInArray["team_id"] as? Int else {
            print("id not Int")
            return nil
        }
        guard let name = teamInArray["team_name"] as? String else {
            print("name not String")
            return nil
        }
        guard let logoString = teamInArray["team_logo"] as? String else {
            print("logoString not String")
            return nil
        }
        
        let imageUrl = URL(string: "https://"+logoString)!
        
        let image = try? UIImage(withContentsOfUrl: imageUrl)
        
        guard let starts = teamInArray["starts_at"] as? String else {
            print("start not String")
            return nil
        }
        
        self.id = id
        self.name = name
        self.logo = image!
        
        let dateString = starts
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dateFromString = formatter.date(from: dateString)
        formatter.dateFormat = "dd-MM-yyyy, HH:mm"
        
        self.startsAt = formatter.string(from: dateFromString!)
    }
}

extension UIImage {
    
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        
        self.init(data: imageData)
    }
    
}
