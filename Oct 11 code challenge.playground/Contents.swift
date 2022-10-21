import UIKit

func twoArr(arrOne: [String], arrTwo: [String]) -> [String]{
    var array = [String]()
    for arr in arrOne {
        for arr2 in arrTwo {
            if arr.lowercased() == arr2.lowercased() {
                array.append(arr)
            } else {
                
            }
        }
    }
    return array
}
twoArr(arrOne: ["Bird", "Lizard", "Fish", "Cat"], arrTwo: ["Dog", "Cat", "Bird"])
