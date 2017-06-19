//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Invitado on 6/14/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var roomType: RoomType?
    var isCheckInDatePickerShown: Bool = false {
        
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown: Bool = false {
        
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    var registration: Registration? {
        
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkIn = checkInDatePicker.date
        let checkOut = checkOutDatePicker.date
        let numberOfAdults = Int(adultsNumberStepper.value)
        let numberOfChildren = Int(childrenNumberStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName,
                            lastName: lastName,
                            email: email,
                            checkInDate: checkIn,
                            checkOutDate: checkOut,
                            numberOfAdults: numberOfAdults,
                            numberOfChildren: numberOfChildren,
                            roomType: roomType,
                            hasWifi: hasWifi)
    }
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var adultNumberLabel: UILabel!
    @IBOutlet weak var childrenNumberLabel: UILabel!
    @IBOutlet weak var adultsNumberStepper: UIStepper!
    @IBOutlet weak var childrenNumberStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var roomTypeLabel: UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 2
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch(indexPath.section, indexPath.row) {
            
            case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row) :
                guard isCheckInDatePickerShown else { return 0 }
                    return 216.0
            
            case(checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row) :
                guard isCheckOutDatePickerShown else { return 0 }
                    return 216.0
            
            default:
                return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        switch(indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row - 1):
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        
        case(checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1) :
            
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown{
                isCheckOutDatePickerShown = true
                isCheckInDatePickerShown = false
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    func updateDateViews() {
        
        let dateFormatter = DateFormatter()
        
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        dateFormatter.dateStyle = .medium
        checkInLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    func updateNumberOfGuests() {
        adultNumberLabel.text = "\(Int(adultsNumberStepper.value))"
        childrenNumberLabel.text = "\(Int(childrenNumberStepper.value))"
    }
    
    func updateRoomType() {
        
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
}
