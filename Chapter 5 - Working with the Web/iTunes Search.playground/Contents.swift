//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct StoreItem {
    
    var title: String
    var artist: String
    var kind: String

    init?(json: [String: Any]) {
        guard let title = json["trackName"],
            let artist = json["artistName"],
            let kind = json["kind"] else { return nil }
        
        self.title = title as! String
        self.artist = artist as! String
        self.kind = kind as! String
    }
}

let query: [String: String] = [
    "term": "Taylor+Swift",
    "limit": "1"
]

func fetchItems(matching query: [String: String], completion: @escaping([StoreItem]?) -> Void) {
    
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let data = data,
            let rawJSON = try? JSONSerialization.jsonObject(with: data),
            let json = rawJSON as? [String: Any],
            let resultsArray = json["results"] as? [[String: Any]] {
            
            let storeItems = resultsArray.flatMap { StoreItem(json: $0)}
                print(json)
                completion(storeItems)
        } else {
            print("No data serialized or returned")
            completion(nil)
            return
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

fetchItems(matching: query) { storedItems in
    print(storedItems)
}