//
//  Alert.swift
//  eggplant-brownie
//
//  Created by José Victor Pereira Costa on 13/01/2018.
//  Copyright © 2018 José Victor Pereira Costa. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    let controller : UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title:String = "Sorry", message:String = "Unexpected error"){
        let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        
        // é chamado o controller em que o erro ocorre para que o
        // mesmo mostre a janela de erro.
        controller.present(alert, animated: true, completion: nil)
    }
}
