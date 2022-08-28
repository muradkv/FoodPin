//
//  Restaurant.swift
//  FoodPin3
//
//  Created by murad on 15.08.2022.
//

import Foundation

struct Restaurant: Hashable {    
    let name: String
    let location: String
    let type: String
    var inFavorites: Bool
    
    init() {
        self.name = ""
        self.location = ""
        self.type = ""
        self.inFavorites = false 
    }
    
    init(name: String, location: String, type: String, inFavorites: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.inFavorites = false
    }
}

struct RestaurantList {
    static let allValues = [
        Restaurant(name: "Cafe Deadend", location: "Hong Kong", type: "Coffee & Tea Shop", inFavorites: false),
        Restaurant(name: "Homei", location: "Hong Kong", type: "Cafe", inFavorites: false),
        Restaurant(name: "Teakha", location: "Hong Kong", type: "Tea House", inFavorites: false),
        Restaurant(name: "Cafe Loisl", location: "Hong Kong", type: "Austrian / Causual Drink", inFavorites: false),
        Restaurant(name: "Petite Oyster", location: "Hong Kong", type: "French", inFavorites: false),
        Restaurant(name: "For Kee Restaurant", location: "Hong Kong", type: "Bakery", inFavorites: false),
        Restaurant(name: "Po's Atelier", location: "Hong Kong", type: "Bakery", inFavorites: false),
        Restaurant(name: "Bourke Street Bakery", location: "Sydney", type: "Chocolate", inFavorites: false),
        Restaurant(name: "Haigh's Chocolate", location: "Sydney", type: "Cafe", inFavorites: false),
        Restaurant(name: "Palomino Espresso", location: "Sydney", type: "American / Seafood", inFavorites: false),
        Restaurant(name: "Upstate", location: "New York", type: "American", inFavorites: false),
        Restaurant(name: "Traif", location: "New York", type: "American", inFavorites: false),
        Restaurant(name: "Graham Avenue Meats And Deli", location: "New York", type: "Breakfast & Brunch", inFavorites: false),
        Restaurant(name: "Waffle & Wolf", location: "New York", type: "Coffee & Tea", inFavorites: false),
        Restaurant(name: "Five Leaves", location: "New York", type: "Coffee & Tea", inFavorites: false),
        Restaurant(name: "Cafe Lore", location: "New York", type: "Latin American", inFavorites: false),
        Restaurant(name: "Confessional", location: "New York", type: "Spanish", inFavorites: false),
        Restaurant(name: "Barrafina", location: "London", type: "Spanish", inFavorites: false),
        Restaurant(name: "Donostia", location: "London", type: "Spanish", inFavorites: false),
        Restaurant(name: "Royal Oak", location: "London", type: "British", inFavorites: false),
        Restaurant(name: "CASK Pub and Kitchen", location: "London", type: "Thai", inFavorites: false)
    ]
}
