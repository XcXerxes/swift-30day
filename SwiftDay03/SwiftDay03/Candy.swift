//
//  Candy.swift
//  SwiftDay03
//
//  Created by leo on 1/16/20.
//  Copyright © 2020 leo. All rights reserved.
//

import Foundation

struct Candy {
    let category: String
    let name: String
    
    init(category: String, name: String) {
        self.category = category
        self.name = name
    }
    
    static func initCandies () -> [Candy] {
        let candies: [Candy] = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear")
        ]
        return candies
    }
}
