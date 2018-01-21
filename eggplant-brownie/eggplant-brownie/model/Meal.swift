//
//  Meal.swift
//  eggplant-brownie
//
//  Created by José Victor Pereira Costa on 02/01/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import Foundation

// para que seja decodificado então a classe deve herdar NSObject
class Meal : NSObject,NSCoding{
    let name:String
    let happiness:Int
    let items: Array<Item>
    
    
    //podemos setar um valor padrão para itens
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    // as classes filhas que erdarem dessa classe também teram que definier este inicializador
    required init?(coder aDecoder:NSCoder) {
        self.name = aDecoder.decodeObject(forKey:"name") as! String
        self.happiness = aDecoder.decodeInteger(forKey:"happiness")
        self.items = aDecoder.decodeObject(forKey:"items") as! Array<Item>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:"name")
        aCoder.encode(happiness, forKey:"happiness")
        aCoder.encode(items, forKey:"items")
        
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
