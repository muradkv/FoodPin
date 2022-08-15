//
//  Restaurant.swift
//  FoodPin3
//
//  Created by murad on 15.08.2022.
//

import Foundation

struct Restaurant: Hashable {    
    let name: String
}

struct RestaurantList {
    static let allValues = [
        Restaurant(name: "Cafe Deadend"),
        Restaurant(name: "Homei"),
        Restaurant(name: "Teakha"),
        Restaurant(name: "Cafe Loisl"),
        Restaurant(name: "Petite Oyster"),
        Restaurant(name: "For Kee Restaurant"),
        Restaurant(name: "Po's Atelier"),
        Restaurant(name: "Bourke Street Bakery"),
        Restaurant(name: "Haigh's Chocolate"),
        Restaurant(name: "Palomino Espresso"),
        Restaurant(name: "Upstate"),
        Restaurant(name: "Traif"),
        Restaurant(name: "Graham Avenue Meats And Deli"),
        Restaurant(name: "Waffle & Wolf"),
        Restaurant(name: "Five Leaves"),
        Restaurant(name: "Cafe Lore"),
        Restaurant(name: "Confessional"),
        Restaurant(name: "Barrafina"),
        Restaurant(name: "Donostia"),
        Restaurant(name: "Royal Oak"),
        Restaurant(name: "CASK Pub and Kitchen")
    ]
}
