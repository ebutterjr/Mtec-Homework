//
//  MealTableViewController.swift
//  MealTracker
//
//  Created by Easton Butterfield on 10/18/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var meals: [Meal] {
        let firstBreakfast = Food(name: "Pancakes", description: "Sweet and delicious")
        let secondBreakfast = Food(name: "Eggs", description: "Yummy and healthy")
        let thirdBreakfast = Food(name: "French Toast", description: "Yummy and Sweet")
        let breakfast = Meal(name: "Breakfast", food: [firstBreakfast, secondBreakfast, thirdBreakfast])
        let firstLunch = Food(name: "Sandwhich", description: "Classic lunch item")
        let secondLunch = Food(name: "Tacos", description: "Tacos for lunch always hit the spot")
        let thirdLunch = Food(name: "Fries", description: "Nothing like some middle of the day fries to get you through the day")
        let lunch = Meal(name: "Lunch", food: [firstLunch, secondLunch, thirdLunch])
        let firstDinner = Food(name: "Sushi", description: "Yummy and savory")
        let secondDinner = Food(name: "Steak", description: "So delicous")
        let thirdDinner = Food(name: "Burger", description: "An American Classic")
        let dinner = Meal(name: "dinner", food: [firstDinner, secondDinner, thirdDinner])
        return [breakfast, lunch, dinner]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let meal = meals[section]
        let food = meal.food
        
        return food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let meal = meals[section]
        
        return meal.name
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
