//
//  Meal.swift
//  eggplant-brownie
//
//  Created by José Victor Pereira Costa on 02/01/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import Foundation

class Meal{
    let name:String
    let happiness:Int
    let items: Array<Item>
    
    
    //podemos setar um valor padrão para itens
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    
// podemos ter vários inicializadores
//    init(name:String, happiness:Int) {
//        self.name = name
//        self.happiness = happiness
//        self.items = []
//    }
    
    func allCalories()->Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        
        return total
    }
    
    func details() -> String{
        var message = "Happines: \(happiness)"
        for item in items{
            message += "\n \(item.name) - calories: \(item.calories)"
        }
        return message
    }
}
