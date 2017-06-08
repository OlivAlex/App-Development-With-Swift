//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Invitado on 6/7/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    private var mealForSection = Meal.init(name: "", food: [])
    private var mealName: String?
    private var food = [Food]()
    
    var breakfastFood: [Food] = [
        Food(name: "Pancakes", description: "Delicious"),
        Food(name: "Apple", description: "Red"),
        Food(name: "Orange Juice", description: "Tasty")
    ]
    var lunchFood: [Food] = [
        Food(name: "Pizza", description: "Amazing"),
        Food(name: "Chicken", description: "Traditional"),
        Food(name: "Bagel", description: "Fast")
    ]
    var dinnerFood: [Food] = [
        Food(name: "Lettuce", description: "Healthy"),
        Food(name: "Crackers", description: "Small")
    ]
    
    var meals: [Meal] {
        
        return [
            Meal(name: "breakfast", food: breakfastFood),
            Meal(name: "lunch", food: lunchFood),
            Meal(name: "dinner", food: dinnerFood)
        ]
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        meals.forEach { meal in
            mealName = meals[section].name
        }
        return mealName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        meals.forEach { meal in
            let meal = meals[section]
            food = meal.food
        }
        return food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        meals.forEach { meal in
            mealForSection = meals[indexPath.section]
        }
        let foodInMeal = mealForSection.food[indexPath.row]
        cell.textLabel?.text = foodInMeal.name
        cell.detailTextLabel?.text = foodInMeal.description
        return cell
    }
 

}
