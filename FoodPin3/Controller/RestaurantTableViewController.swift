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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: true)

    }

    func configureDataSource() -> UITableViewDiffableDataSource<Section, Restaurant> {
        
        let cellIdentifier = "dataCell"
        
        let dataSource = UITableViewDiffableDataSource<Section, Restaurant> (
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurant in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                cell.textLabel?.text = restaurant.name
                cell.imageView?.image = UIImage(named: restaurant.name)
                return cell
                
            }
        )
        
        return dataSource
    }

}