import UIKit

func belowFive(numbers: String) -> String {
    var newString = ""
    for number in numbers {
        if let intValue = number.wholeNumberValue {
        if intValue < 5 {
            newString += "0"
        } else  if intValue >= 5{
            newString += "1"
        }
    }
}
    return newString
}
let result = belowFive(numbers: "1635")
print(result)
