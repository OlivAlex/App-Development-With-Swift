//
//  ViewController.swift
//  Light_AO
//
//  Created by Invitado on 5/31/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
    @IBOutlet weak var lightButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI() {
        if lightOn == true {
            view.backgroundColor = .white
            lightButton.setTitle("Off", for: .normal)
        }else{
            view.backgroundColor = .black
            lightButton.setTitle("On", for: .normal)
        }
    }

}

