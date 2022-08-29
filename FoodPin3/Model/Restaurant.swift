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
    let phone: String
    let description: String
    var inFavorites: Bool
    
    init() {
        self.name = ""
        self.location = ""
        self.type = ""
        self.phone = ""
        self.description = ""
        self.inFavorites = false 
    }
    
    init(name: String, location: String, type: String, phone: String, description: String, inFavorites: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.phone = phone
        self.description = description
        self.inFavorites = false
    }
}

struct RestaurantList {
    static let allValues = [
        Restaurant(name: "Cafe Deadend", location: "Hong Kong", type: "Coffee & Tea Shop", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", inFavorites: false),
        Restaurant(name: "Homei", location: "Hong Kong", type: "Cafe", phone: "348-233423", description: "A little gem hidden at the corner of the street is nothing but fantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", inFavorites: false),
        Restaurant(name: "Teakha", location: "Hong Kong", type: "Tea House", phone: "354-243523", description: "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", inFavorites: false),
        Restaurant(name: "Cafe Loisl", location: "Hong Kong", type: "Austrian / Causual Drink", phone: "453-333423", description: "A great cafe in Austrian style. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. We also serve breakfast and light lunch. Come over to enjoy the elegant ambience and quality coffee..", inFavorites: false),
        Restaurant(name: "Petite Oyster", location: "Hong Kong", type: "French", phone: "983-284334", description: "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan.", inFavorites: false),
        Restaurant(name: "For Kee Restaurant", location: "Hong Kong", type: "Bakery", phone: "232-434222", description: "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM.", inFavorites: false),
        Restaurant(name: "Po's Atelier", location: "Hong Kong", type: "Bakery", phone: "234-834322", description: "A boutique bakery focusing on artisan breads and pastries paired with inspiration from Japan and Scandinavia. We are crazy about bread and excited to share our artisan bakes with you. We open at 10 every morning, and close at 7 PM.", inFavorites: false),
        Restaurant(name: "Bourke Street Bakery", location: "Sydney", type: "Chocolate", phone: "982-434343", description: "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!", inFavorites: false),
        Restaurant(name: "Haigh's Chocolate", location: "Sydney", type: "Cafe", phone: "734-232323", description: "Haigh's Chocolates is Australia's oldest family owned chocolate maker. We have been making chocolate in Adelaide, South Australia since 1915 and we are committed to the art of premium chocolate making from the cocoa bean. Our chocolates are always presented to perfection in our own retail stores. Visit any one of them and you'll find chocolate tasting, gift wrapping and personalised attention are all part of the service.", inFavorites: false),
        Restaurant(name: "Palomino Espresso", location: "Sydney", type: "American / Seafood", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", inFavorites: false),
        Restaurant(name: "Upstate", location: "New York", type: "American", phone: "872-734343", description: "We offer an assortment of on-site baked goods and sandwiches. This place has always been a favourite among office workers. We open at 7 every morning including Sunday, and close at 4 PM. Come over, have a coffee and enjoy a chit-chat with our baristas.", inFavorites: false),
        Restaurant(name: "Traif", location: "New York", type: "American", phone: "232-923423", description: "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM. ", inFavorites: false),
        Restaurant(name: "Graham Avenue Meats And Deli", location: "New York", type: "Breakfast & Brunch", phone: "985-723623", description: "A young crowd populates this pork-focused American eatery in an older Williamsburg neighborhood. We open at 6PM, and close at 11 PM. If you enjoy a shared small plates dinner experience, come over and have a try.", inFavorites: false),
        Restaurant(name: "Waffle & Wolf", location: "New York", type: "Coffee & Tea", phone: "455-232345", description: "Classic Italian deli & butcher draws patrons with meat-filled submarine sandwiches. We use the freshest meats and veggies to create the perfect panini for you. We look forward to seeing you!", inFavorites: false),
        Restaurant(name: "Five Leaves", location: "New York", type: "Coffee & Tea", phone: "434-232322", description: "Small shop, some seating, definitely something different! We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of waffles with choices of sweet & savory fillings. If you are gluten free and craving waffles, this is the place to go.", inFavorites: false),
        Restaurant(name: "Cafe Lore", location: "New York", type: "Latin American", phone: "343-234553", description: "Great food, cocktails, ambiance, service. Nothing beats having a warm dinner and a whiskey. We open at 8 every morning, and close at 1 AM. The ricotta pancakes are something you must try.", inFavorites: false),
        Restaurant(name: "Confessional", location: "New York", type: "Spanish", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", inFavorites: false),
        Restaurant(name: "Barrafina", location: "London", type: "Spanish", phone: "342-455433", description: "Good place, great environment and amazing food! We open at 10 every morning except Sunday, and close at 9 PM. Give us a visit! Enjoy mushroom raviolis, pumpkin raviolis, meat raviolis with sausage and peppers, pork cutlets, eggplant parmesan, and salad.", inFavorites: false),
        Restaurant(name: "Donostia", location: "London", type: "Spanish", phone: "643-332323", description: "Most delicious cocktail you would ever try! Our menu includes a wide range of high quality internationally inspired dishes, vegetarian options, and local cuisine. We open at 10 AM, and close at 10 PM. We welcome you into our place to enjoy a meal with your friends.", inFavorites: false),
        Restaurant(name: "Royal Oak", location: "London", type: "British", phone: "542-343434", description: "A collection of authentic Spanish Tapas bars in Central London! We have an open kitchen, a beautiful marble-topped bar where guests can sit and watch the chefs at work and stylish red leather stools. Lunch starts at 1 PM. Dinners starts 5:30 PM.", inFavorites: false),
        Restaurant(name: "CASK Pub and Kitchen", location: "London", type: "Thai", phone: "722-232323", description: "Very good basque food, creative dishes with terrific flavors! Donostia is a high end tapas restaurant with a friendly relaxed ambiance. Come over to enjoy awesome tapas!", inFavorites: false)
    ]
}
