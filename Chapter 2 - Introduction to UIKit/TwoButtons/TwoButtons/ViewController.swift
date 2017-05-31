//
//  ViewController.swift
//  TwoButtons
//
//  Created by Invitado on 5/31/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setTextPressed(_ sender: Any) {
        textLabel.text = textField.text
    }
    @IBAction func clearTextPressed(_ sender: Any) {
        textLabel.text = " "
        textField.text = " "
    }

}

