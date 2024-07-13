//Задание 1

//import Foundation
//
//func calcDepAmount(depAmount: Double, annualRate: Double, years: Double) -> Double {
//    let Rate = annualRate / 100.0
//    let totalAmount = depAmount * pow(1 + Rate, Double(years)) //Надеюсь, что я правильно понял формулу расчёта процентов по ставке, т.к. никогда с этим не сталкивался =)
//    return totalAmount
//}
//
//let depAmount = 10550.0
//let annualRate = 3.7
//let years = 10.0
//
//let finalAmount = calcDepAmount(depAmount: depAmount, annualRate: annualRate, years: years)
//let clearAmount = finalAmount - depAmount
//
//let formattedFinalAmount = String(format: "%.1f", finalAmount) // Эти две строки подсмотрел в интернетах, потому что очень уж не нравились 15 знаков после запятой)
//let formattedClearAmount = String(format: "%.1f", clearAmount)
//
//print("Клиент получит \(formattedFinalAmount) EUR, из них \(formattedClearAmount) чистой прибылью. ")



//Задание 2

//enum PizzaType: String {
//    case margherita = "Margherita"
//    case capricciosa = "Capricciosa"
//    case marinara = "Marinara"
//}
//
//let margheritaPizza = PizzaType.margherita
//let capricciosaPizza = PizzaType.capricciosa
//let marinaraPizza = PizzaType.marinara
//
//print(PizzaType.margherita.rawValue)
//print(PizzaType.capricciosa.rawValue)
//print(PizzaType.marinara.rawValue)
//
