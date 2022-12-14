//
//  TableViewController.swift
//  FoodPin3
//
//  Created by murad on 14.08.2022.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants = RestaurantList.allValues
    lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: true)
        
        //Does not allow stretching the image to the edges on iPad
        tableView.cellLayoutMarginsFollowReadableWidth = true

    }

    func configureDataSource() -> RestaurantDiffableDataSource {
        
        let cellIdentifier = CellIdentifier.verticalUI.rawValue
        
        let dataSource = RestaurantDiffableDataSource (
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurant in
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestaurantTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.nameLabel.text = restaurant.name
                cell.thumbnailImageView.image = UIImage(named: restaurant.name)
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.heartImageView.image = UIImage(systemName: "heart.fill")
                
                if self.restaurants[indexPath.row].inFavorites {
                    cell.heartImageView.isHidden = false
                } else {
                    cell.heartImageView.isHidden = true
                }
                
                return cell
                
            }
        )
        
        return dataSource
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell else { return }
//
//        //Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        //Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//
//        //Add "Reserve a table" action
//        let reserveActionHandler = { (action:UIAlertAction!) -> Void in
//
//            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default))
//            self.present(alertMessage, animated: true)
//        }
//        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
//
//        //Mark as favorite action
//        let favoriteAction = UIAlertAction(title: "Mark as favorite", style: .default) { (action:UIAlertAction!) -> Void in
//
//            cell.heartImageView.isHidden = self.restaurants[indexPath.row].inFavorites
//            self.restaurants[indexPath.row].inFavorites = true
//        }
//
//        //Remove frome favorites action
//        let removeAction = UIAlertAction(title: "Remove from favorites", style: .default) { (action:UIAlertAction!) -> Void in
//
//            cell.heartImageView.isHidden = self.restaurants[indexPath.row].inFavorites
//            self.restaurants[indexPath.row].inFavorites = false
//        }
//
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(reserveAction)
//
//        if self.restaurants[indexPath.row].inFavorites {
//            optionMenu.addAction(removeAction)
//        } else {
//            optionMenu.addAction(favoriteAction)
//        }
//
//        //Correct show alert controller with popover style on iPad
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//        //Display menu
//        present(optionMenu, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Get the selected restaurant
        guard let restaurant = dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        //Delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
            //Call the completion handler to dismiss the action button
            completionHandler(true)
        }
        
        //Share action
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just checking in at " + restaurant.name
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: restaurant.name) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            //Present share action on iPad in a popover
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceRect = cell.bounds
                    popoverController.sourceView = cell
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        shareAction.backgroundColor = UIColor.systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        //Configure both actions as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell else { return UISwipeActionsConfiguration() }
        
        let favoriteAction = UIContextualAction(style: .normal, title: "") { (action, sourceView, completionHandler) in
            
            cell.heartImageView.isHidden = self.restaurants[indexPath.row].inFavorites
            
            if self.restaurants[indexPath.row].inFavorites {
                self.restaurants[indexPath.row].inFavorites = false
            } else {
                self.restaurants[indexPath.row].inFavorites = true
            }
            
            completionHandler(true)
        }
        
        favoriteAction.backgroundColor = UIColor.systemYellow
        
        if restaurants[indexPath.row].inFavorites {
            favoriteAction.image = UIImage(systemName: "heart.slash.fill")
        } else {
            favoriteAction.image = UIImage(systemName: "heart.fill")
        }
        
        //Configure action as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
        
        return swipeConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destination = segue.destination as! RestaurantDetailViewController
                destination.restaurant = restaurants[indexPath.row]
            }
        }
    }

}
