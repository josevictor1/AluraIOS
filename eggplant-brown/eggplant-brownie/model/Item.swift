//
//  Item.swift
//  eggplant-brownie
//
//  Created by José Victor Pereira Costa on 02/01/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import Foundation

class Item: Equatable{
    
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
}

func ==(first:Item, second:Item) ->Bool{
    return first.name == second.name && first.calories == second.calories
}
