//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Invitado on 6/6/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import Foundation

final class Emoji: NSObject, NSCoding{
    
    var symbol: String
    var name: String
    var descriptionOfEmoji: String
    var usage: String
    
    init(symbol: String, name: String, descriptionOfEmoji: String, usage: String) {
        
        self.symbol = symbol
        self.name = name
        self.descriptionOfEmoji = descriptionOfEmoji
        self.usage = usage
    }
    
    struct PropertyKeys{
        
        static let symbol = "symbol"
        static let name = "name"
        static let descriptionOfEmoji = "descriptionOfEmoji"
        static let usage = "usage"
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let symbol = aDecoder.decodeObject(forKey: "symbol") as? String,
            let name = aDecoder.decodeObject(forKey: "name") as? String,
            let descriptionOfEmoji = aDecoder.decodeObject(forKey: "descriptionOfEmoji") as? String,
            let usage = aDecoder.decodeObject(forKey: "usage") as? String
            
            else { return nil }
        
        self.init(symbol: symbol, name: name, descriptionOfEmoji: descriptionOfEmoji, usage: usage)
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(symbol, forKey: PropertyKeys.symbol)
        aCoder.encode(name, forKey: PropertyKeys.name)
        aCoder.encode(descriptionOfEmoji, forKey: PropertyKeys.descriptionOfEmoji)
        aCoder.encode(usage, forKey: PropertyKeys.usage)
    }
    
    //Initializing File Path
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static var archiveURL: URL {
        return documentsDirectory.appendingPathComponent("emojis")
    }
    
    //Save & Load functions, writing in the path, or fetching what is in the path
    static func saveToFile(emojis: [Emoji]) {
        let archivedEmojis = NSKeyedArchiver.archiveRootObject(emojis, toFile: Emoji.archiveURL.path)
    }
    
    static func loadFromFile() -> [Emoji]? {
        let unarchivedEmojis = NSKeyedUnarchiver.unarchiveObject(withFile: Emoji.archiveURL.path) as! [Emoji]?
        return unarchivedEmojis
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        
        return [
            Emoji(symbol: "😀", name: "Grinning Face", descriptionOfEmoji:
                "Typical smiley face", usage: "happiness"),
            Emoji(symbol: "😂", name: "Crying of Laughter", descriptionOfEmoji: "Face laughing a lot", usage: "when something is very very funny"),
            Emoji(symbol: "😉", name: "Winky Face", descriptionOfEmoji: "Normal face winking", usage: "Normal wink"),
            Emoji(symbol: "😍", name: "Heart Eyes", descriptionOfEmoji: "A similey face with hearts for eyes", usage: "love of something: attraction"),
            Emoji(symbol: "😈", name: "Evil Smiley", descriptionOfEmoji: "Smiley face with horns", usage: "Evil plans"),
            Emoji(symbol: "☠", name: "Skull cross", descriptionOfEmoji: "A skull with a bone cross in the back", usage: "Depict danger"),
            Emoji(symbol: "🕵", name: "Detective", descriptionOfEmoji: "Man that looks like a detective", usage: "Investigating something"),
            Emoji(symbol: "🌚", name: "New moon face", descriptionOfEmoji: "A dark moon with a suspicious face", usage: "A sort of smiley face, hiding something"),
            Emoji(symbol: "🇲🇽", name: "Flag of Mexico", descriptionOfEmoji: "The national flag of Mexico", usage: "Representation of mexico"),
            Emoji(symbol: "👨‍💻", name: "Man with computer", descriptionOfEmoji: "A man working on his laptop", usage: "Someone working on his computer"),
            Emoji(symbol: "🙄", name: "Rolling Eyes", descriptionOfEmoji: "A face rolling eyes", usage: "Tired of something, strong dislike towards something"),
            Emoji(symbol: "😞", name: "Dissapointed Face", descriptionOfEmoji: "A face with a strong feeling of sadness", usage: "When something very sad happened"),
            Emoji(symbol: "😳", name: "Flushed face", descriptionOfEmoji: "A face with an expression of surprise", usage: "Something out of the ordinary happened")
        ]
    }
}
