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
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            
            self.restaurantsInFavorites[indexPath.row] = true
        }
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(reserveAction)
        optionMenu.addAction(favoriteAction)
        
        //Display menu
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
