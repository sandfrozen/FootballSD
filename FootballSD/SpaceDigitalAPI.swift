//
//  SpaceDigitalAPI.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation
import UIKit

class SpaceDigitalAPI {
    
    class func getFormations(callback: @escaping ([[String: AnyObject]]) -> Void)  {
        guard let url = URL(string: "https://spacedigital.pl/katalog/rekrutacja/formations.php") else {
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    guard let teamsJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject], let teamsArr = teamsJSON["formations"] as? [[String: AnyObject]] else {
                        print("🔥 guard invoked while JSONSerialization")
                        return
                    }
                    callback(teamsArr)
                } catch {
                    print("Error in session.dataTask: \(error)")
                }
            }
        }.resume()
    }
    
    
}
