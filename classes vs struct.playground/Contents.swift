import UIKit

struct People {
    var shoes = 2
    mutating func buyShoes(){
        shoes += 1
    }
}
var person = People(shoes: 2)
print(person.shoes)
person.buyShoes()
print(person.shoes)

class Peoples {
    var shoesOne = 2
    init(shoesOne: Int) {
        
    }
    func buyShoesOne(){
        shoesOne += 1
    }
}
var persons = Peoples(shoesOne: 2)
print(persons.shoesOne)
persons.buyShoesOne()
print(persons.shoesOne)
