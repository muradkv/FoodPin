//
//  RestaurantDetailViewController.swift
//  FoodPin3
//
//  Created by murad on 28.08.2022.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var type: UILabel!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurant.name)
        name.text = restaurant.name
        location.text = restaurant.location
        type.text = restaurant.type
        
        navigationItem.largeTitleDisplayMode = .never
    }

}
