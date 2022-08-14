//
//  TableViewController.swift
//  FoodPin3
//
//  Created by murad on 14.08.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    let restaurants = RestaurantList.allValues

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        
        cell.textLabel?.text = restaurants[indexPath.row].names
        return cell
    }

}
