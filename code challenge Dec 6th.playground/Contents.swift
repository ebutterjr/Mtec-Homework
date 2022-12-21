import UIKit

func num(a: Int, b: Int) -> [Int] {
    guard a < b else {return [0]
    }
    var nums: [Int] = []
    for num in a...b {
        nums.append(num)
    }
    return nums
    
}
num(a: 1, b: 4)
