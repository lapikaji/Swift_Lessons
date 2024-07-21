import Foundation

enum PizzaType: String {
    case margherita = "Margherita"
    case pepperoni = "Pepperoni"
    case marinara = "Marinara"
    case capricciosa = "Capricciosa"
    case quattroFormaggi = "Quattro Formaggi"
}

enum Extras: String {
    case sausage = "Pepperoni"
    case tomatoes = "Dried Tomatoes"
    case cheese = "Mozarella"
    case mushrooms = "Mushrooms"
    case ham = "Mortadella"
}

enum PizzaSize: String {
    case grande = "Grande"
    case piccola = "Piccola"
}

struct Pizza {
    var price: Double
    var type: PizzaType
    var isThickCrust: Bool
    var toppings: [Extras]
    var size: PizzaSize
    
    var crustDescription: String {
        return isThickCrust ? "thick crust" : "thin crust" // Не очень нравятся "сырые" True/False на выходе, поэтому немного преобразовал их. В качестве альтернативного способа можно было сделать перечисление (сделал так для размера пиццы, строки 19-22)
    }
}

class Pizzeria {
    private var availablePizzas: [Pizza]
    
    init(pizzas: [Pizza]) {
        self.availablePizzas = pizzas
    }
    
    func addPizza(_ pizza: Pizza) {
        availablePizzas.append(pizza)
    }
    
    func getPizzas() -> [Pizza] {
        return availablePizzas
    }
}

let pizza1 = Pizza(price: 4.99, type: .margherita, isThickCrust: false, toppings: [.cheese, .tomatoes], size: .grande)
let pizza2 = Pizza(price: 6, type: .pepperoni, isThickCrust: true, toppings: [.sausage, .cheese], size: .piccola)
let pizza3 = Pizza(price: 6.99, type: .marinara, isThickCrust: false, toppings: [.cheese, .tomatoes], size: .grande)
let pizza4 = Pizza(price: 8, type: .capricciosa, isThickCrust: true, toppings: [.mushrooms, .ham, .cheese], size: .piccola)
let pizza5 = Pizza(price: 8.99, type: .quattroFormaggi, isThickCrust: false, toppings: [.cheese], size: .grande)

let pizzeria = Pizzeria(pizzas: [pizza1, pizza2, pizza3, pizza4, pizza5])

    let newPizza = Pizza(price: 7, type: .pepperoni, isThickCrust: false, toppings: [.sausage, .mushrooms, .cheese], size: .grande)
pizzeria.addPizza(newPizza)

print("Special offer!")

let allPizzas = pizzeria.getPizzas()
for pizza in allPizzas {
    print("\(pizza.type.rawValue) \(pizza.size.rawValue) with \(pizza.crustDescription) and lovely toppings (\(pizza.toppings.map { $0.rawValue }.joined(separator: ", "))) for only \(pizza.price) EUR!")
}
