//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct PropertyKey {
    
    static let title = "title"
    static let description = "explanation"
    static let url = "url"
    static let copyright = "copyright"
}

struct PhotoInfo {
    
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    init?(json: [String: String]) {
        guard let title = json[PropertyKey.title],
            let description = json[PropertyKey.description],
            let urlString = json[PropertyKey.url],
            let url = URL(string: urlString) else { return nil }
        
        self.title = title
        self.description = description
        self.url = url
        self.copyright = json[PropertyKey.copyright]
    }
}

func fetchPhotoInfo(completion: @escaping(PhotoInfo?) -> Void) {
    
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
        "date" : "2017-06-19"
    ]
    
    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let data = data, let rawJSON = try? JSONSerialization.jsonObject(with: data), let json = rawJSON as? [String: String], let photoInfo = PhotoInfo(json: json) {
            completion(photoInfo)
        } else {
            print("Either no data was returned, or data was not serialized")
            completion(nil)
        }
    }
    task.resume()
}

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

fetchPhotoInfo { (fetchedInfo) in print(fetchedInfo) }