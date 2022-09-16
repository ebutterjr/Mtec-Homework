import UIKit


class Person {
    var name: String
    var age: Int
    var height: Double
    var weight: Int
    init(name: String, age: Int, height: Double, weight: Int){
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
    }
    func greeting() {
        print("Hello, my name is \(name), and I am \(age) years old.")
    }
    func birthday() {
        age += 1
    }
    
}
var person = Person(name: "Easton", age: 18, height: 6.0, weight: 135)
person.greeting()
print(person.age)
person.birthday()
print(person.age)
person.greeting()
