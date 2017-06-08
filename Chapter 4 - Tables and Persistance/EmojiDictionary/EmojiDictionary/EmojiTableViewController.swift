//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Invitado on 6/6/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard section == 0 else { return 0 }
        return emojis.count
    }
    
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description:
        "Typical smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Crying of Laughter", description: "Face laughing a lot", usage: "when something is very very funny"),
        Emoji(symbol: "😉", name: "Winky Face", description: "Normal face winking", usage: "Normal wink"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A similey face with hearts for eyes", usage: "love of something: attraction"),
        Emoji(symbol: "😈", name: "Evil Smiley", description: "Smiley face with horns", usage: "Evil plans"),
        Emoji(symbol: "☠", name: "Skull cross", description: "A skull with a bone cross in the back", usage: "Depict danger"),
        Emoji(symbol: "🕵", name: "Detective", description: "Man that looks like a detective", usage: "Investigating something"),
        Emoji(symbol: "🌚", name: "New moon face", description: "A dark moon with a suspicious face", usage: "A sort of smiley face, hiding something"),
        Emoji(symbol: "🇲🇽", name: "Flag of Mexico", description: "The national flag of Mexico", usage: "Representation of mexico"),
        Emoji(symbol: "👨‍💻", name: "Man with computer", description: "A man working on his laptop", usage: "Someone working on his computer"),
        Emoji(symbol: "🙄", name: "Rolling Eyes", description: "A face rolling eyes", usage: "Tired of something, strong dislike towards something"),
        Emoji(symbol: "😞", name: "Dissapointed Face", description: "A face with a strong feeling of sadness", usage: "When something very sad happened"),
        Emoji(symbol: "😳", name: "Flushed face", description: "A face with an expression of surprise", usage: "Something out of the ordinary happened")
    ]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let emoji = emojis[indexPath.row]
        
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        cell.showsReorderControl = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol) \(indexPath)")
    }
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
