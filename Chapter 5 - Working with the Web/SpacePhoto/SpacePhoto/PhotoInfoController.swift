//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Invitado on 6/20/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import Foundation

class PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = [
            "api_key": "d8JzgA3myJjwmLNt568LWTQYHBgcnaI3eoxbc7vM"
        ]
        
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String],
                let photoInfo = PhotoInfo(json: json)  {
                completion(photoInfo)
            } else {
                print("Either no data was serialized or data was not returned")
                print("Error: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
