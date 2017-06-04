//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Invitado on 6/2/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var labelMiddleView: UILabel!
    var eventNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let existingText = labelMiddleView.text {
            labelMiddleView.text = "\(existingText)\n Event Number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let existingText = labelMiddleView.text {
            labelMiddleView.text = "\(existingText)\n Event Number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let existingText = labelMiddleView.text {
            labelMiddleView.text = "\(existingText)\n Event Number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let existingText = labelMiddleView.text {
            labelMiddleView.text = "\(existingText)\n Event Number \(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let existingText = labelMiddleView.text {
            labelMiddleView.text = "\(existingText)\n Event Number \(eventNumber) was viewDidDisappear"
            
            eventNumber += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
