//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Invitado on 6/1/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segueSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        guard segueSwitch.isOn else { return }
        performSegue(withIdentifier: "Yellow", sender: nil)
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        guard segueSwitch.isOn else { return }
        performSegue(withIdentifier: "Green", sender: nil)
    }
    
}

