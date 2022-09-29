import UIKit

func findIfArrayConatins(arr: [Any?], x: Any?) -> Bool {
   var arrayIsString = false
    var valueIsString = false
    
    if let _ = arr as? [String] {
        arrayIsString = true
    }
    if let _ = x as? String {
        valueIsString = true
    }
    if arrayIsString && valueIsString {
        guard let arrayAsString = arr as? [String],
              let valueAsString = x as? String else {
            return false
        }
        return arrayAsString.contains(valueAsString)
    }
    else if !arrayIsString && !valueIsString {
        guard let arrayAsInt = arr as? [Int],
              let valueAsInt = x as? Int else{
            return false
        }
        return arrayAsInt.contains(valueAsInt)
    }
    return arrayIsString
}
findIfArrayConatins(arr: ["1","2","3","4","5"], x: "3")
