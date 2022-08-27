//
//  RestaurantDiffableDataSource.swift
//  FoodPin3
//
//  Created by murad on 27.08.2022.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if let restaurant = itemIdentifier(for: indexPath) {
                var snapshot = snapshot()
                snapshot.deleteItems([restaurant])
                apply(snapshot, animatingDifferences: true)
            }
        }
        
    }
}
