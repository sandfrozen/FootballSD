//
//  SpaceDigitalAPI.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation
import os.log

class SpaceDigitalAPI {
    
    class func getTeams(callback: @escaping ([[String: AnyObject]]) -> Void)  {
        
        guard let url = URL(string: "https://spacedigital.pl/katalog/rekrutacja/formations.php") else {
            return
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    guard let teamsJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject], let teamsArr = teamsJSON["formations"] as? [[String: AnyObject]] else {
                        os_log("Unable to decode the teams from Fromations JSON.", log: OSLog.default, type: .debug)
                        return
                    }
                    callback(teamsArr)
                } catch {
                    print("Error in SpaceDigitalAPI.getTeams: \(error)")
                }
            }
            semaphore.signal()
        }.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    
    class func getPlayers(teamId: Int) -> [[String: AnyObject]] {
        let stringUrl: String = "https://www.spacedigital.pl/katalog/rekrutacja/team.php?team_id=" + teamId.description
        var players = [[String: AnyObject]]()
        
        guard let url = URL(string: stringUrl) else {
            return players
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    guard let playersJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject], let playersArr = playersJSON["players"] as? [[String: AnyObject]] else {
                        os_log("Unable to decode the players from Players JSON.", log: OSLog.default, type: .debug)
                        return
                    }
                    players = playersArr
                } catch {
                    print("Error in SpaceDigitalAPI.getPlayers: \(error)")
                }
            }
            semaphore.signal()
            }.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return players
    }
}
