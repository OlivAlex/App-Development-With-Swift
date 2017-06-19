//
//  Registration.swift
//  HotelManzana
//
//  Created by Invitado on 6/15/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import Foundation

struct Registration {
    
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var hasWifi: Bool
}
