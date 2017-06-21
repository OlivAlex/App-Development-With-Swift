//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Invitado on 6/20/17.
//  Copyright © 2017 Caleb Hicks. All rights reserved.
//

import Foundation
import UIKit

class StoreItemController {
    
    func fetchItems(matching query: [String: String], completion: @escaping([StoreItem]?) -> Void) {
        
        let baseURL = URL(string: "https://itunes.apple.com/search?")!
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: Any],
                let resultsArray = json["results"] as? [[String: Any]] {
                
                let storeItems = resultsArray.flatMap { StoreItem(json: $0)}
                completion(storeItems)
            } else {
                print("No data serialized or returned")
                completion(nil)
                return
            }
        }
        task.resume()
    }
    
    func fetchImage(imageURL: URL, completion: @escaping(UIImage) -> Void ) {
        
        let imageTask = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let image = UIImage(data: data!) {
                completion(image)
            }
        }
        imageTask.resume()
    }
}
