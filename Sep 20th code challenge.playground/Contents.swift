import UIKit

func firstEven(number: Int) -> Int {
    var finalNumber = 0
    if number > 0 {
       finalNumber = (number * 2) - 2
    }
    return finalNumber
}
firstEven(number: 1298734)
