import UIKit

func intArray(numbers: [Int]){
    for number in numbers {
        var newNumber = Double(number)
        newNumber = newNumber.squareRoot()
        if newNumber.truncatingRemainder(dividingBy: 1) == 0{
            print (Int(newNumber))
        } else {
            newNumber = newNumber * newNumber
            newNumber = newNumber * newNumber
            print (Int(newNumber))
        }
    }
}
intArray(numbers: [2,4,6,9])
