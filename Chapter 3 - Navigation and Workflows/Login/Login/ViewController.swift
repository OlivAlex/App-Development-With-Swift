//
//  ViewController.swift
//  Login
//
//  Created by Invitado on 6/1/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var forgotUsernameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else{ return }
        
        if sender == forgotPasswordButton {
            
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernameButton{
            
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            
            segue.destination.navigationItem.title = userNameTextField.text
        }
        
    }
    
    @IBAction func forgotPassButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginToLanding", sender: forgotPasswordButton)
    }
    
    @IBAction func forgotUsernamePressed(_ sender: Any) {
        performSegue(withIdentifier: "loginToLanding", sender: forgotUsernameButton)
    }

   
}

