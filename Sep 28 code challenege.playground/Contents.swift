import UIKit

// Your goal is to return multiplication table for number that is always an integer from 1 to 10.

//For example, a multiplication table (string) for number == 5 looks like below:

// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25
// 6 * 5 = 30
// 7 * 5 = 35
// 8 * 5 = 40
// 9 * 5 = 45
// 10 * 5 = 50
// P. S. You can use \n in string to jump to the next line.

func multiplicationTable(number: Int) {
       
            var numbers:Int = 0
            var numberOne:Int = 1
    while numberOne <= 10{
    if number > 0 {
        numbers = numberOne * number
        print ("\(numberOne) * \(number) = \(numbers)")
        numberOne += 1
    } else { return}

    }
}
multiplicationTable(number: 3)
