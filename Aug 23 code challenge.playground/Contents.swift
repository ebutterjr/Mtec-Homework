import UIKit

struct Rectangle {
    var sideA: Int
    var sideB: Int
    func area() -> Int {
        return sideA * sideB
    }
    func perimeter() -> Int {
    return (sideA + sideB) * 2
    }
}
var rectangle = Rectangle(sideA: 2, sideB: 3)
print(rectangle.area())
print(rectangle.perimeter())
