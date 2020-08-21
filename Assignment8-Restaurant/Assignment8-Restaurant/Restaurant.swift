//
//  Restaurant.swift
//  Assignment8-Restaurant
//
//  Created by happy on 2020-08-20.
//  Copyright © 2020 Carlos. All rights reserved.
//

import Foundation
import UIKit

struct Restaurant: Hashable, Comparable {
    
    
    static func < (lhs: Restaurant, rhs: Restaurant) -> Bool {
        lhs.id < rhs.id
    }
    
    let id: Int
    let name: String
    let cost: Int
    let timeCategories: [String]
    let foodCategories: [String]
    //let image: UIImage?
    let image: UIImage?
}

func sampleRestaurants() -> [Restaurant] {
    return [Restaurant(id: 1,
                       name: "Ajiaco",
                       cost: 20,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Colombian", "Chicken"],
                       image: UIImage(named: "Ajiaco-2")),
            Restaurant(id: 2,
                       name: "Bandeja paisa",
                       cost: 3,
                       timeCategories: ["Lunch"],
                       foodCategories: ["Colombian", "Meat"],
                       image: UIImage(named: "bandejaP")),
            Restaurant(id: 3,
                       name: "Empanada",
                       cost: 2,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Colombian", "BBQ"],
                       image: UIImage(named: "empanadas")),
            Restaurant(id: 4,
                       name: "McDonald's",
                       cost: 1,
                       timeCategories: ["Breakfast", "Brunch", "Lunch", "Dinner"],
                       foodCategories: ["Burger", "Fast Food", "American"],
                       image: UIImage(named: "McDonald")),
            Restaurant(id: 5,
                       name: "Subway",
                       cost: 1,
                       timeCategories: ["Breakfast", "Brunch", "Lunch", "Dinner"],
                       foodCategories: ["American", "Healthy", "Sandwich", "Salads", "Fast Food"],
                       image: UIImage(named: "subway")),
            Restaurant(id: 6,
                       name: "A&W",
                       cost: 20,
                       timeCategories: ["Breakfast", "Brunch", "Lunch", "Dinner"],
                       foodCategories: ["Burger", "American", "Fast Food"],
                       image: UIImage(named: "AW")),
                       
            Restaurant(id: 7,
                       name: "Tim Hortons",
                       cost: 10,
                       timeCategories: ["24/7"],
                       foodCategories: ["Cofee", "Comfort Food", "Bakery", "Juice Bars"],
                       image: UIImage(named: "tim_hortons")),
            Restaurant(id: 8,
                       name: "Starbucks",
                       cost: 10,
                       timeCategories: ["Breakfast", "Brunch", "Lunch", "Dinner"],
                       foodCategories: ["Bakery", "Cafe"],
                       image: UIImage(named: "Starbucks")),
            Restaurant(id: 9,
                       name: "Poutine",
                       cost: 10,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Canadian"],
                       image: UIImage(named: "Poutine")),
            Restaurant(id: 10,
                       name: "Caesar",
                       cost: 8,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Canadian", "Drink", "Juice"],
                       image: UIImage(named: "Caesar")),
            Restaurant(id: 11,
                       name: "BeaverTails",
                       cost: 10,
                       timeCategories: ["Dinner"],
                       foodCategories: ["Canadian", "Dessert"],
                       image: UIImage(named: "BeaverTails")),
            Restaurant(id: 12,
                       name: "Butter Tarts",
                       cost: 14,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Canadian", "Dessert"],
                       image: UIImage(named: "Butter Tarts")),
            Restaurant(id: 13,
                       name: "Sushi",
                       cost: 40,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Japanese"],
                       image: UIImage(named: "MomoSushi")),
            Restaurant(id: 14,
                       name: "Tourtière",
                       cost: 12,
                       timeCategories: ["Lunch", "Dinner"],
                       foodCategories: ["Canadian", "Dessert"],
                       image: UIImage(named: "Tourtière")),
            
            Restaurant(id: 15,
                       name: "lasagna",
                       cost: 3,
                       timeCategories: ["Dinner"],
                       foodCategories: ["Italian", "Lunch"],
                       image: UIImage(named: "lasagna"))]
}
