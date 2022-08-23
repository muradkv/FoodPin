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
}

var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

struct RestaurantList {
    static let allValues = [
        Restaurant(name: "Cafe Deadend", location: "Hong Kong", type: "Coffee & Tea Shop"),
        Restaurant(name: "Homei", location: "Hong Kong", type: "Cafe"),
        Restaurant(name: "Teakha", location: "Hong Kong", type: "Tea House"),
        Restaurant(name: "Cafe Loisl", location: "Hong Kong", type: "Austrian / Causual Drink"),
        Restaurant(name: "Petite Oyster", location: "Hong Kong", type: "French"),
        Restaurant(name: "For Kee Restaurant", location: "Hong Kong", type: "Bakery"),
        Restaurant(name: "Po's Atelier", location: "Hong Kong", type: "Bakery"),
        Restaurant(name: "Bourke Street Bakery", location: "Sydney", type: "Chocolate"),
        Restaurant(name: "Haigh's Chocolate", location: "Sydney", type: "Cafe"),
        Restaurant(name: "Palomino Espresso", location: "Sydney", type: "American / Seafood"),
        Restaurant(name: "Upstate", location: "New York", type: "American"),
        Restaurant(name: "Traif", location: "New York", type: "American"),
        Restaurant(name: "Graham Avenue Meats And Deli", location: "New York", type: "Breakfast & Brunch"),
        Restaurant(name: "Waffle & Wolf", location: "New York", type: "Coffee & Tea"),
        Restaurant(name: "Five Leaves", location: "New York", type: "Coffee & Tea"),
        Restaurant(name: "Cafe Lore", location: "New York", type: "Latin American"),
        Restaurant(name: "Confessional", location: "New York", type: "Spanish"),
        Restaurant(name: "Barrafina", location: "London", type: "Spanish"),
        Restaurant(name: "Donostia", location: "London", type: "Spanish"),
        Restaurant(name: "Royal Oak", location: "London", type: "British"),
        Restaurant(name: "CASK Pub and Kitchen", location: "London", type: "Thai")
    ]
}
