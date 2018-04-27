//
//  Model.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation

struct Post: Codable {
    let channel: String
    let username: String
    let text: String
    let icon_emoji: String
    
    init(lat: String, long: String) {
        let text = "Name: Alex - Latitude: " + lat + ", Longitude: " + long + "."
        
        self.channel = "#ios-alex"
        self.username = "Alex_Hoff"
        self.text = text
        self.icon_emoji = ":ghost:"
    }
}
