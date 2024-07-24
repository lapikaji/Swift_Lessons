import Foundation

protocol MenuItem {
    var price: Double { get }
    var description: String { get }
}

struct Pizza: MenuItem {
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
    
    var description: String {
        return "\(type.rawValue) \(size.rawValue) with \(crust.rawValue) crust and lovely toppings (\(toppings.map { $0.rawValue }.joined(separator: ", ")))"
    }
}

struct FrenchFries: MenuItem {
    enum FrySize: String {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
    }
    var price: Double
    var size: FrySize
    
    var description: String {
        return "\(size.rawValue) French Fries"
    }
}

class Pizzeria {
    private var menuItems: [MenuItem] = []
    
    func addMenuItem(_ item: MenuItem) {
        menuItems.append(item)
    }
    
    func getMenuItems() -> [MenuItem] {
        return menuItems
    }
    
    func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
        return a - b
    }
    
    func calculateComboPrice(pizza: Pizza, fries: FrenchFries, discount: Double) -> Double {
        let totalPrice = pizza.price + fries.price
        return subtract(totalPrice, discount)
    }
    
    func calculatePriceDifference<T: Numeric>(between first: T, and second: T) -> T {
        return subtract(first, second)
    }
}

protocol PizzeriaProtocol {
    func open()
    func close()
}

extension Pizzeria: PizzeriaProtocol {
    func open() {
        print("Welcome!")
    }
    
    func close() {
        print("Hurry up!")
    }
}

let pizza1 = Pizza(price: 4.50, type: .margherita, toppings: [.cheese, .tomatoes], size: .grande, crust: .thin)
let pizza2 = Pizza(price: 7, type: .pepperoni, toppings: [.mushrooms], size: .grande, crust: .thin)
let fries1 = FrenchFries(price: 2, size: .medium)

let pizzeria = Pizzeria()
pizzeria.addMenuItem(pizza1)
pizzeria.addMenuItem(pizza2)
pizzeria.addMenuItem(fries1)

pizzeria.open()

print("Today's menu:")
for item in pizzeria.getMenuItems() {
    print("\(item.description) for only \(item.price) EUR!")
}

let comboDiscount = 1.00

let priceDifference = pizzeria.calculatePriceDifference(between: pizza2.price, and: pizza1.price)
let comboPrice = pizzeria.calculateComboPrice(pizza: pizza1, fries: fries1, discount: comboDiscount)
print("Special Offer! Combo with \(pizza1.description) and \(fries1.description) for only \(comboPrice) EUR!")
print("Want some more? Pay just \(priceDifference) EUR extra and get the Pepperoni-Combo!")

pizzeria.close()
