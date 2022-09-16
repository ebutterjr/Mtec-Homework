import UIKit


func multiply(numbers: [Int]) -> [Int] {
    var newNumbers = [Int]()
    for number in numbers {
        let newNumber = number * 5
        newNumbers.append(newNumber)
    }
    return newNumbers
}

var arrayTimesedByFive = multiply(numbers: [2,3,4,5,6])
print(arrayTimesedByFive)
