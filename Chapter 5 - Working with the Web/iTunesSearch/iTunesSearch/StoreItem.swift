//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Invitado on 6/20/17.
//  Copyright © 2017 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem {
    
    var title: String
    var artist: String
    var kind: String
    var url: URL
    
    init?(json: [String: Any]) {
        guard let title = json["trackName"],
            let artist = json["artistName"],
            let kind = json["kind"],
            let urlString = json["artworkUrl100"],
            let url = URL(string: urlString as! String) else { return nil }
        
        self.title = title as! String
        self.artist = artist as! String
        self.kind = kind as! String
        self.url = url 
    }
}
