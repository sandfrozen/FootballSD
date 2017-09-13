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
    
    static var names = [String]()
    
    class func formations() {
        guard let url = URL(string: "https://spacedigital.pl/katalog/rekrutacja/formations.php") else {
            return
        }
        //var json = [String: Any]()
        
        let session = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let data = data {
                do {
                    var json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    print(json)
                    let jsonTeams = json["formations"] as? [[String:Any]]
                    for jsonTeam in jsonTeams! {
                        guard let name = jsonTeam["team_name"]! as? String else{
                            print("team_name not String")
                            break
                        }
                        names.append(name)
                    }

                } catch {
                    print(error)
                }
            }
        }
        session.resume()
        print(names)
    }

//    class func getTeams() -> [Team]? {
//        guard let url = URL(string: "https://spacedigital.pl/katalog/rekrutacja/formations.php") else {
//            return nil
//        }
//        
//        let session = URLSession.shared
//        session.dataTask(with: url) {
//            (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//            if let data = data {
//                //print(data)
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                    print(json)
//                    let jsonTeams = json["formations"] as? [[String:Any]]
//                    for jsonTeam in jsonTeams! {
//                        guard let id = jsonTeam["team_id"]! as? Int else{
//                            print("team_id not Int")
//                            break
//                        }
//                        guard let name = jsonTeam["team_name"]! as? String else{
//                            print("team_name not String")
//                            break
//                        }
//                        guard let stringUrl = jsonTeam["team_logo"]! as? String  else{
//                            print("team_logo not String")
//                            break
//                        }
//                        var logo: UIImage?
//                        let url = URL(string: stringUrl)
//                        let data = try? Data(contentsOf: url!)
//                        if let imageData = data {
//                            logo = UIImage(data: imageData)!
//                            
//                        }
//                        guard let starts = jsonTeam["starts_at"]! as? String else{
//                            print("starts_at not String")
//                            break
//                        }
////                      print(id)
////                      print(name)
////                      print(stringUrl)
////                      print(logo)
//                        guard let newTeam = Team(id: id, name: name, logo: logo, startsAt: starts) else {
//                            print("Unable to create team")
//                            break
//                        }
//                        self.teams.append(newTeam)
//                    }
//                    
//                } catch {
//                    print(error)
//                }
//            }
//            }.resume()
//
//    }
}
