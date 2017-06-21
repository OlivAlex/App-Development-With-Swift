//
//  URL+Helpers.swift
//  iTunesSearch
//
//  Created by Invitado on 6/20/17.
//  Copyright © 2017 Caleb Hicks. All rights reserved.
//

import Foundation

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
