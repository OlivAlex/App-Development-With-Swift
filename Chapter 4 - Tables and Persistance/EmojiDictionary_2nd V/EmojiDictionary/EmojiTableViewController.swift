//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Invitado on 6/6/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let savedEmojis = Emoji.loadFromFile() else {
            return emojis = Emoji.loadSampleEmojis()
        }
        emojis = savedEmojis
        
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else { return 0 }
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        //Step 2: Fetch model object to display
        let emoji = emojis[indexPath.row]
        
        //Step 3: Configure the cell
        cell.update(with: emoji)
        cell.showsReorderControl = true
        
        //Step 4: Return the cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }    
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let addEditEmojiTableViewController = segue.destination as! AddEditEmojiTableViewController
            addEditEmojiTableViewController.emoji = emoji
        }
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddEditEmojiTableViewController
        
        if let emoji = sourceViewController.emoji {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                emojis[selectedIndexPath.row] = emoji
                Emoji.saveToFile(emojis: emojis)
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: emojis.count, section: 0)
                emojis.append(emoji)
                Emoji.saveToFile(emojis: emojis)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    @IBAction func refreshControlActivated(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
}
