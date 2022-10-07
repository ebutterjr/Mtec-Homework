import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var indexes: [Int] = []
    for (i, num) in nums.enumerated() {
        indexes.append(i)
        for(j, num2) in nums.enumerated() {
            if (j != j && num + num2 == target) {
                indexes.append(j)
                return indexes
            }
        }
    indexes = []
    }
}

