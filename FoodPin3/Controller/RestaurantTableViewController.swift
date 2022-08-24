//
//  TableViewController.swift
//  FoodPin3
//
//  Created by murad on 14.08.2022.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    enum Section {
        case all
    }
    
    let restaurants = RestaurantList.allValues
    lazy var dataSource = configureDataSource()
    var restaurantsInFavorites = Array(repeating: false, count: RestaurantList.allValues.count)

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

    func configureDataSource() -> UITableViewDiffableDataSource<Section, Restaurant> {
        
        let cellIdentifier = CellIdentifier.verticalUI.rawValue
        
        let dataSource = UITableViewDiffableDataSource<Section, Restaurant> (
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurant in
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestaurantTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.nameLabel.text = restaurant.name
                cell.thumbnailImageView.image = UIImage(named: restaurant.name)
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.accessoryType = self.restaurantsInFavorites[indexPath.row] ? .checkmark : .none
                return cell
                
            }
        )
        
        return dataSource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        //Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        //Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        //Add "Reserve a table" action
        let reserveActionHandler = { (action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertMessage, animated: true)
        }
        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
        
        //Mark as favorite action
        let favoriteAction = UIAlertAction(title: "Mark as favorite", style: .default) { (action:UIAlertAction!) -> Void in
            
            cell?.accessoryType = .checkmark
            self.restaurantsInFavorites[indexPath.row] = true
        }
        
        //Remove frome favorites action
        let removeAction = UIAlertAction(title: "Remove from favorites", style: .default) { (action:UIAlertAction!) -> Void in
            
            cell?.accessoryType = .none
            self.restaurantsInFavorites[indexPath.row] = false
        }
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(reserveAction)
        
        if self.restaurantsInFavorites[indexPath.row] {
            optionMenu.addAction(removeAction)
        } else {
            optionMenu.addAction(favoriteAction)
        }
        
        //Correct show alert controller with popover style on iPad
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        //Display menu
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
