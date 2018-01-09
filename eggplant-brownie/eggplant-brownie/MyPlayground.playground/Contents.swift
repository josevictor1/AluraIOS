//: Playground - noun: a place where people can play


/* teste
 varias linhas */

import UIKit

/*
var str:String = "eggplant"
var calories:Double = 55.0
let happiness:Int = 5

let eggplantIsAVegetable:Bool = false //boolean 

func helloCalories(){
    let product = "brownie"
    print("Hello Calories \(product)")
}

helloCalories()

func add(name:String, calories:Double){
    print("adding \(name) with \(calories)")
}

add(name:"Brownie",calories:2.5)
*/

/*

//print(calories)

for i in calories{
    print(i)
}

for i in 0...4{
    print(i)
}
*/

/*
let calories:Array<Double> = [50.1,60.1,70.1,80.1,90.1,100]



func allCalories(calories:Array<Double>)->Double{
    
    var total:Double = 0
    
    for c in calories{
        total += c
    }
    return total
}

print(allCalories(calories: calories))

var values = [1,2]
var total = 0
for v in values{
    total += v
}
print(total/values.count)
 
 */

class Meal{
    //? significa que o valor de inicialização da variavel é opcional
    var happiness:Int //= 5
    var name:String //= "eggplant brownie"
    var items = Array<Item>() // ou var items:Array<Item>
    
    // Como fugir do opcional ??? Utilizar um inicializador
    //uso de inicialização conhecido como padrão bom cidadão, em inglês good citizen.
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories()->Double{
        
        var total:Double = 0
        
        for i in items{
                total+=i.calories
        }
        return total
    }
}
class Item{
    var name:String
    var calories:Double
    
    init(name:String ,calories:Double){
        self.name = name
        self.calories = calories
    }
}

//o objeto brownie é constante, entretanto seus elemento são variáveis
//nulo(nil) é aceito somente para variaveis opcionais
let brownie = Meal(name: "eggplant brownie", happiness: 5)
brownie.name = "eggplant"
brownie.happiness = 4
print(brownie.happiness) //vai aparecer nil == nulo == null

//! afirmação faz com que seja exibido, força
//print(brownie.name!.uppercased()) // ==
//

//preferivelmente utilizar if let para exetrair valores de opcionais(qunado estivermos utilizando opcionais)
/*
if let name = brownie.name{
    print(name.uppercased())
}*/

//quando definimos um opcional com ! afirmamos que ele pode ter um valor nulo,(normalmente não a verificação alguma da existencia de valores na variável)
//evitar !, preferivelmente ?, melhor ainda não utilizar opcional
var name:String!
name = "josevictor"
print(name.uppercased())

let item1 = Item(name:"item1", calories: 115)
let item2 = Item(name:"item2", calories: 40)

brownie.items.append(item1)
brownie.items.append(item2)

print(brownie.allCalories())












