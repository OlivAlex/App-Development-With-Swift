//
//  Meal.swift
//  MealTracker
//
//  Created by Invitado on 6/7/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import Foundation

class Meal {
    
    var name: String
    var food: [Food]
    
    init (name: String, food: [Food]) {
        self.name = name
        self.food = food
    }
}
