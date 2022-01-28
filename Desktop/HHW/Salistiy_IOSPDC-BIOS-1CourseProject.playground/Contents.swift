/*
 1.Создайте следующие протоколы и определите в них свойства и методы.
1.1. Ресторан
Свойства: название, сотрудники, склад с продуктами, меню.
1.2. Сотрудник
Свойства: имя, пол, возраст, должность (менеджер, повар, официант и т.д.).
1.3. Блюдо
Свойства: тип блюда (салат, горячее, гарнир, десерт), ингредиенты (картофель, лук, мясо, соль), время приготовления, цена.
1.4. Заказ
Свойства: время получения заказа, время отдачи заказа, блюда в заказе, готовность.

 2.Создайте следующие классы и структуры.
2.1. Должности (менеджер, повар, официант и т.д.) подписать под протокол Сотрудник. Свойства и методы зависят от должности. Для поваров продумать несколько должностей. Каждый должен иметь метод “готовить”, но иметь еще свои методы. Например, повар холодного цеха делает салаты; повар горячего цеха умеет варить и жарить, шеф-повар умеет все (можно сделать привязку к типу блюда).
2.2. Конкретные блюда подписать под протокол Блюда. Ингредиенты зависят от типа блюда. Например, для яичницы нужны: яйца, масло, соль. Создать минимум 5 блюд.
2.3. Заказ подпишите под протокол Заказы.
3.Создайте хранилища:
продукты (ингредиенты), хранящиеся на складе с указанием количества (продумайте, какой вид коллекции использовать). Создайте минимум 15 продуктов на складе.
заказы. Содержит в себе заказы.
Добавлять свои свойства и методы допустимо.
Продумайте, где можно и нужно использовать enum вместо стандартных свойств.

Задача co звездочкой (необязательное задание) Реализуйте логику в методах. Например, у официанта метод "принять заказ" добавляет в начало хранилища с заказами переданный заказ. Повар берет первый добавленный заказ из хранилища и готовит. В данном случае нужно разобраться с FIFO и LIFO. После приготовления устанавливается время приготовления, статус меняется на "готов". Наприер, вы можете учесть, что от типа блюда заказ может выполнить нужный повар или шеф. Реализуйте любую логику на ваше усмотрение.
*/

//1.1. Протокол Ресторан
//Свойства: название, сотрудники, склад с продуктами, меню.

protocol RestarauntProtocol {
    var name: String {get set}
    var employees: [EmployeesProtocol] {get set} // почему стринг, ведь есть нужный протокол?
    var warehouse: [WareHouse] {get set}
    var menu: [DishProtocol] {get set}
}


//1.2.Протокол Сотрудник
//Свойства: имя, пол, возраст, должность (менеджер, повар, официант и т.д.).

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

enum PositionEnum: String {
    case chef = "Chef"
    case saladCook = "SaladCook"
    case dessertCook = "DessertCook"
    case garnishCook = "GarnishCook"
    case firstCourseCook = "FirstCourseCook"
    case manager = "Manager"
    case waiter = "Waiter"
    case cleaner = "Cleaner"
    case restarauntDirector = "RestarauntDirector"
}

protocol EmployeesProtocol {
    var employeesName: String {get set}
    var employeesSex: Gender {get set}
    var employeesAge: Int {get set}
    func introduce (employeesName: String, employeesSex: Gender, employeesAge: Int, employeesPosition: PositionEnum) -> Void
    //  func employeesFunc () -> Void
}

//1.3.Протокол Блюдо
//Свойства: тип блюда (салат, горячее, гарнир, десерт), ингредиенты (картофель, лук, мясо, соль), время приготовления, цена.

enum DishesType: String {
    case salad = "Salad"
    case firstCourse = "FirstCourse"
    case garnish = "Garnish"
    case dessert = "Dessert"
}

enum Ingridient: String {
    case potato = "Potato"
    case onion = "Onion"
    case meat = "Meat"
    case salt = "Salt"
    case butter = "Butter"
    case milk = "Milk"
    case iceCream = "IceCream"
    case apple = "Apple"
    case cherry = "Cherry"
    case strawberry = "Strawberry"
    case tomato = "Tomato"
    case pickle = "Pickle"
    case bread = "Bread"
    case groundMeat = "GroundMeat"
    case pepper =  "Pepper"
    case oil = "Oil"
}

protocol DishProtocol {
    var dishesTime: Double {get set}
    var dishesCost: Double {get set}
    var dishesType: DishesType {get set}
    var dishesIngridient: [Ingridient] {get set}
}

/*1.4. Протокол Заказ
 Свойства: время получения заказа, время отдачи заказа, блюда в заказе, готовность.*/

enum Ready: String {
    case ready = "Ready"
    case notReady = "notReady"
}

protocol OrderProtocol {
    var ordersGetTime: Double {get set}
    var ordersGiveTime: Double {get set}
    var ordersDish: DishProtocol {get set}
    var ordersReady: Ready {get set}
}

/*2.Создайте следующие классы и структуры.
 2.1. Должности (менеджер, повар, официант и т.д.) подписать под протокол Сотрудник. Свойства и методы зависят от должности. Для поваров продумать несколько должностей. Каждый должен иметь метод “готовить”, но иметь еще свои методы. Например, повар холодного цеха делает салаты; повар горячего цеха умеет варить и жарить, шеф-повар умеет все (можно сделать привязку к типу блюда).
 */
class OrdinaryPositionClass: EmployeesProtocol {
    var employeesName: String
    var employeesSex: Gender
    var employeesAge: Int
    init(employeesName: String, employeesSex: Gender, employeesAge: Int) {
        self.employeesName = employeesName
        self.employeesSex = employeesSex
        self.employeesAge = employeesAge
    }
    func introduce (employeesName: String, employeesSex: Gender, employeesAge: Int, employeesPosition: PositionEnum) -> Void {
        print ("Добрый день! Меня зовут \(employeesName), мне \(employeesAge) лет. Я \(employeesSex). Я работаю \(employeesPosition)")
    }
}

class ChefClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.chef
    func chefsFunctional () -> Void {
        print ("я отвечаю за приготовление:\(DishesType.dessert), \(DishesType.firstCourse), \(DishesType.garnish), \(DishesType.salad)")
    }
}

var chefsObject: ChefClass = ChefClass(employeesName: "q", employeesSex: Gender.male , employeesAge: 1)

class SaladCookerClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.saladCook
    func SaladCookersFunctional () -> Void {
        print ("я отвечаю за приготовление:\(DishesType.salad)")
    }
}

class DessertCookerClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.dessertCook
    func DessertCookersFunctional () -> Void {
        print ("я отвечаю за приготовление:\(DishesType.dessert)")
    }
}

class GarnishCookerClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.garnishCook
    func GarnishCookersFunctional () -> Void {
        print ("я отвечаю за приготовление:\(DishesType.garnish)")
    }
}

class FirstCourseCookerClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.firstCourseCook
    func FirstCoursesFunctional () -> Void {
        print ("я отвечаю за приготовление:\(DishesType.firstCourse)")
    }
}

class ManagerClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.manager
    func ManagersFunctional () -> Void {
        print ("моя задача руководить: \(PositionEnum.waiter), \(PositionEnum.cleaner)")
    }
}

class WaiterClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.waiter
    func WaitersFunctional () -> Void {
        print ("моя задача принимать заказы у гостей и приносить им блюда")
    }
}

class CleanerClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.cleaner
    func CleanersFunctional () -> Void {
        print ("моя задача поддерживать в ресторане чистоту и порядок")
    }
}

class RestarauntDirectorClass: OrdinaryPositionClass {
    var employeesPosition: PositionEnum = PositionEnum.restarauntDirector
    func RestarauntDirectorsFunctional () -> Void {
        print ("я ответственнен за все бизнес процессы ресторана")
    }
}
// 2.2. Конкретные блюда подписать под протокол Блюда. Ингредиенты зависят от типа блюда. Например, для яичницы нужны: яйца, масло, соль. Создать минимум 5 блюд.

class Сutlet: DishProtocol {
    var dishesTime: Double = 60 // min
    var dishesCost: Double = 200.5 // rub
    var dishesType: DishesType = DishesType.firstCourse
    var dishesIngridient: [Ingridient] = [Ingridient.groundMeat, Ingridient.onion, Ingridient.bread, Ingridient.milk, Ingridient.salt]
}

class PiclesTomatoes: DishProtocol {
    var dishesTime: Double = 30 // min
    var dishesCost: Double = 100.5 // rub
    var dishesType: DishesType = DishesType.salad
    var dishesIngridient: [Ingridient] = [Ingridient.pickle, Ingridient.tomato, Ingridient.salt, Ingridient.oil]
}

class IceCreamFruits: DishProtocol {
    var dishesTime: Double = 15 // min
    var dishesCost: Double = 300.5 // rub
    var dishesType: DishesType = DishesType.dessert
    var dishesIngridient: [Ingridient] = [Ingridient.iceCream, Ingridient.apple, Ingridient.strawberry, Ingridient.cherry]
}

class MashedPotatoes: DishProtocol {
    var dishesTime: Double = 40 // min
    var dishesCost: Double = 150 // rub
    var dishesType: DishesType = DishesType.garnish
    var dishesIngridient: [Ingridient] = [Ingridient.potato, Ingridient.salt, Ingridient.butter, Ingridient.milk]
}

class Steak: DishProtocol {
    var dishesTime: Double = 30 //min
    var dishesCost: Double = 1000 //rub
    var dishesType: DishesType = DishesType.firstCourse
    var dishesIngridient: [Ingridient] = [Ingridient.meat, Ingridient.salt, Ingridient.pepper, Ingridient.oil]
}
var steakObject = Steak ()


//2.3. Заказ подпишите под протокол Заказы.
enum Menu: String {
    case cutlet = "Сutlet"
    case piclesTomatoes = "PiclesTomatoes"
    case iceCreamFruits = "IceCreamFruits"
    case mashedPotatoes = "MashedPotatoes"
    case steak = "Steak"
}

class Order: OrderProtocol {
    var ordersGetTime: Double
    var ordersGiveTime: Double
    var ordersDish: DishProtocol
    var ordersReady: Ready
    init (ordersGetTime: Double, ordersGiveTime: Double, ordersDish: DishProtocol, ordersReady: Ready) {
        self.ordersGetTime = ordersGetTime
        self.ordersGiveTime = ordersGiveTime
        self.ordersDish = ordersDish
        self.ordersReady = ordersReady
    }
    func getOrder (ordersGetTime: Double, ordersGiveTime: Double, ordersDish: DishProtocol, ordersReady: Ready) -> Void {
        let a = ordersGetTime
        let b = ordersGiveTime
        let c = ordersDish
        let d = ordersReady
            
        ordersStorage.append("время получения заказа:\(a), время отдачи заказа:\(b), блюда в заказе:\(c), готовность:\(d)")
    }
}
 
 
/*
 3. Создайте хранилища:
-продукты (ингредиенты), хранящиеся на складе с указанием количества (продумайте, какой вид коллекции использовать). Создайте минимум 15 продуктов на складе.
-заказы. Содержит в себе заказы.
Добавлять свои свойства и методы допустимо.
Продумайте, где можно и нужно использовать enum вместо стандартных свойств. */

struct WareHouse {
    var food: [String]
    var amount: [Double]
}

var sklad = WareHouse (food: ["Potato", "Onion", "Meat", "Salt", "Butter", "Milk", "IceCream", "Apple", "Cherry",
                              "Strawberry", "Tomato", "Pickle", "Bread", "GroundMeat", "Pepper", "Oil"],
                       amount: [5.1, 10.4, 101.1, 1.1, 35.8, 12.4, 132.2, 15.5, 12.3, 12.6, 56.5, 34.5, 12.2, 34.5,
                                1.0, 111.1])

var wareHouseObject = zip (sklad.food, sklad.amount)

var ordersStorage: [String] = []

var someObject: Order = Order (ordersGetTime: 1.1, ordersGiveTime: 1.2, ordersDish: steakObject, ordersReady: Ready.ready)
someObject.getOrder(ordersGetTime: 15, ordersGiveTime: 2.10, ordersDish: steakObject, ordersReady: Ready.ready)
print (ordersStorage)
