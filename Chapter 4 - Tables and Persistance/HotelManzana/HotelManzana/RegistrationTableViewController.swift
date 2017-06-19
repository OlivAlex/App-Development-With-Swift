//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Invitado on 6/15/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        let registration = registrations[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = registration.firstName + " "+registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name
        
        return cell
    }
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        
        guard let AddRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController, let registration = AddRegistrationTableViewController.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
    }
}
