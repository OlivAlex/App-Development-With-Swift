//: Playground - noun: a place where people can play

import UIKit

final class Note: NSObject, NSCoding {
    
    let title: String
    let text: String
    let timestamp: Date

    init(title: String, text: String, timestamp: Date){
        
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
    struct PropertyKeys {
        static let title = "title"
        static let text = "text"
        static let timestamp = "timestamp"
    }
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let title = aDecoder.decodeObject(forKey: "title") as? String,
        let text = aDecoder.decodeObject(forKey: "text") as? String,
        let timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Date
        else { return nil }
        
        self.init(title: title, text: text, timestamp: timestamp)
    }
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(title, forKey: PropertyKeys.title)
        aCoder.encode(text, forKey: PropertyKeys.text)
        aCoder.encode(timestamp, forKey: PropertyKeys.timestamp)
    }
    override var description: String {
        return "Note(title: \"\(title)\", text: \"\(text), timestamp: \(timestamp)"
    }
}

let note1 = Note(title: "New Hope", text: "We have the plans.", timestamp: Date())
let note2 = Note(title: "Another note", text: "This is another sample note", timestamp: Date())
let note3 = Note(title: "And another", text: "This is yet another note", timestamp: Date())
let notes = [note1, note2, note3]

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes")

let archivedNotes = NSKeyedArchiver.archiveRootObject(notes, toFile: archiveURL.path)
let unarchivedNotes = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [Note]

print(unarchivedNotes)
