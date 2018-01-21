//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by José Victor Pereira Costa on 04/01/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import UIKit

class MealsTableViewController : UITableViewController, AddAMealDelegate{
    var meals = [Meal(name:"Teste 1", happiness: 5),
                 Meal(name:"Teste 2", happiness: 6)]
    
    func add(_ meal: Meal){
        meals.append(meal)
        // salva o objeto no diretório selecionado
        Dao().saveMeals(meals: meals)
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        
        self.meals = Dao().loadMeals()
    }
    
    // ...(_ ...) o "_" significa que o prarametro não possui nome
    // pode-se também dar um nome externo e um interno para o parâmetro. ex:
    // prepara(for segue: ...) , onde "for"é nome externo e "segue"é nome interno.
    
    //Passa a si mesmo como classe delegada para que seja possível adicionar uma refeição
    //uso de mudanças de tela de forma programática
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    
    // exibir as refeições no table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        // cria a celuala
        let cell = UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        //reconhece o gesto de apertar
        let longPressRecognizer = UILongPressGestureRecognizer(target: self , action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    
    //Gerando uma pquena mensagem de detalhes ao clicar sobre uma refeirção
    // Através da menssagem gerada é possível também excluir a refeição.
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        if(recognizer.state == UIGestureRecognizerState.began){
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals[row]
                
                
                RemoveMealController.init(controller: self).show(meal, handler:{action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()})
                
            }
            
            
            print("Long presure")
        }
    }
    
    
    
}
