import UIKit
func lcm(a: Int, b: Int) -> Int {
    var counter = 1
    var result = 0
    if a < b {
        while (a * counter) % b != 0 {
            result = (a * counter) + a
            counter += 1
        
        }
    } else {
        while (b*counter) % a != 0 {
            result = (b * counter) + b
            counter += 1
        }
    }
    return result
}

print(lcm(a: 17, b: 11))
