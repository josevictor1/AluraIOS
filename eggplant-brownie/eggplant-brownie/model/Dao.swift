//
//  Dao.swift
//  eggplant-brownie
//
//  Created by José Victor Pereira Costa on 21/01/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import Foundation

class Dao {
    func saveMeals(meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: getArchive())
    }
    
    func getArchive()-> String{
        //Buscas os diretorios do dominio, no diretório documento para este usuário
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0] // primeiro diretório
        let archivePath = "\(dir)eggplant-brownie-meals.dados"
        return archivePath
    }
    
    func loadMeals() -> Array<Meal>{
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getArchive()){
            let meals = loaded as! Array<Meal>
            return meals
        }
        else{
            return []
        }
    }
}
