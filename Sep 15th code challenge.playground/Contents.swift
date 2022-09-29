import UIKit

func sums(numbers: [Int]) -> Int? {
    var numberSums = 0
    for number in numbers {
        if number >= 0  {
            numberSums = number + numberSums
        }
        
    }
    return numberSums
}

sums(numbers: [1,-5,7,8])
