//
//  ViewController.swift
//  AppEventCount
//
//  Created by Invitado on 6/6/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    var finishLaunchingCounter = 0
    var resignActiveCounter = 0
    var enterBackgroundCounter = 0
    var enterForegroundCounter = 0
    var becomeActiveCounter = 0
    var willTerminateCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        
        didFinishLaunchingLabel.text = "App has launched \(finishLaunchingCounter) times"
        willResignActiveLabel.text = "App has resigned \(resignActiveCounter) times"
        didEnterBackgroundLabel.text = "App has entered background \(enterBackgroundCounter) times"
        willEnterForegroundLabel.text = "App has entered foreground \(enterForegroundCounter) times"
        didBecomeActiveLabel.text = "App has become active \(becomeActiveCounter) times"
        willTerminateLabel.text = "App has terminated \(willTerminateCounter) times"
    }
}

