import Foundation

struct Pizza {
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
    enum CrustType: String {
        case thick = "Thick"
        case thin = "Thin"
    }
    var price: Double
    var type: PizzaType
    var toppings: [Extras]
    var size: PizzaSize
    var crust: CrustType
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
        availablePizzas
    }
}

let pizza1 = Pizza(price: 4.99, type: .margherita, toppings: [.cheese, .tomatoes], size: .grande, crust: .thin)
let pizza2 = Pizza(price: 6, type: .pepperoni, toppings: [.sausage, .cheese], size: .piccola, crust: .thick)
let pizza3 = Pizza(price: 6.99, type: .marinara, toppings: [.cheese, .tomatoes], size: .grande, crust: .thin)
let pizza4 = Pizza(price: 8, type: .capricciosa, toppings: [.mushrooms, .ham, .cheese], size: .piccola, crust: .thick)
let pizza5 = Pizza(price: 8.99, type: .quattroFormaggi, toppings: [.cheese], size: .grande, crust: .thin)

let pizzeria = Pizzeria(pizzas: [pizza1, pizza2, pizza3, pizza4, pizza5])

    let newPizza = Pizza(price: 7, type: .pepperoni, toppings: [.sausage, .mushrooms, .cheese], size: .grande, crust: .thin)
pizzeria.addPizza(newPizza)

print("Special offer!")

let allPizzas = pizzeria.getPizzas()
for pizza in allPizzas {
    print("\(pizza.type.rawValue) \(pizza.size.rawValue) with \(pizza.crust) crust and lovely toppings (\(pizza.toppings.map { $0.rawValue }.joined(separator: ", "))) for only \(pizza.price) EUR!")
}
