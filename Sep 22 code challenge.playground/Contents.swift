import UIKit

func summation(number: Int) -> Int {
    var currentNum = 0
    var numbers = number
    while currentNum < number {
            numbers = numbers + currentNum
            currentNum = currentNum + 1
    
    }

    return numbers
        
    }

summation(number: 8)
