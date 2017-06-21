//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Invitado on 6/20/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import Foundation

struct PhotoInfo {
    
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    struct  PropertyKeys {
        static let title = "title"
        static let description = "explanation"
        static let url = "url"
        static let copyright = "copyright"
    }
    
    init?(json: [String: String]) {
        guard let title = json[PropertyKeys.title],
            let description = json[PropertyKeys.description],
            let urlString = json[PropertyKeys.url],
            let url = URL(string: urlString) else { return nil }
        
        self.title = title
        self.description = description
        self.url = url
        self.copyright = json[PropertyKeys.copyright]
    }
}
