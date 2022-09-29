import UIKit

func stringy(numbers: Int){
    var binary = ""
    for number in 1...numbers {
        if number % 2 == 0 {
            binary.append("0")
        } else {
            binary.append("1")
        }
        
    }
    print(binary)
    
}
stringy(numbers: 6)
