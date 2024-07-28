struct Employee {
    let name: String
    let salary: Double
    let position: Position

    enum Position {
        case cashier
        case cook
    }
}

class Table {
    let seats: Int
    weak var pizzeria: Pizzeria?
    
    init(seats: Int, pizzeria: Pizzeria) {
        self.seats = seats
        self.pizzeria = pizzeria
    }
    
    func canSeat(guests: Int) -> Bool {
        return guests <= seats
    }
    
    func canSeatMessage(guests: Int) -> String {
            return canSeat(guests: guests) ? "Yes" : "No"
    }
}

class Pizzeria {
    var employees: [Employee] = []
    var tables: [Table] = []
    
    init(numberOfTables: Int, seatsPerTable: Int) {
        for _ in 0..<numberOfTables {
            let table = Table(seats: seatsPerTable, pizzeria: self)
            tables.append(table)
        }
    }
    
    func addEmployee(_ employee: Employee) {
        employees.append(employee)
    }

    func listEmployees() {
        for employee in employees {
            print("Position: \(employee.position), Name: \(employee.name), Salary: \(employee.salary) EUR gross")
        }
    }
}

let employee1 = Employee(name: "Milojko Spajic", salary: 900.0, position: .cashier)
let employee2 = Employee(name: "Jakov Milatovic", salary: 1100.0, position: .cook)

let pizzeria = Pizzeria(numberOfTables: 5, seatsPerTable: 4)
pizzeria.addEmployee(employee1)
pizzeria.addEmployee(employee2)

pizzeria.listEmployees()

for (index, table) in pizzeria.tables.enumerated() {
    print("Table #\(index + 1): \(table.seats) seats")
}

let guests1 = Int.random(in: 1...10) // ради интереса добавил рандом по количеству гостей
let guests2 = Int.random(in: 1...10)

if let firstTable = pizzeria.tables.first {
    print("Will a group of people (\(guests1) guests) be able to sit at the first table? \(firstTable.canSeatMessage(guests: guests1))")
    print("Will a group of people (\(guests2) guests) be able to sit at the first table? \(firstTable.canSeatMessage(guests: guests2))")
}
