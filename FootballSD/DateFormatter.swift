//
//  DateFormatter.swift
//  FootballSD
//
//  Created by Tomek Buslowski on 13.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func polishFormat(string: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dateFromString = formatter.date(from: string)
        
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: dateFromString!)
    }
    
    static func birthFormat(string: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        let dateFromString = formatter.date(from: string)
        
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: dateFromString!)
    }
    
}
