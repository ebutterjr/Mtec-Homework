import UIKit

func square(numbers: [Int]) -> Int {
    var sum: Int = 0
    for  number in numbers {
        sum += number * number
}
    return sum
}
square(numbers: [1,2,3])

