import UIKit

func firstNonConsecutive (in array: [Int]) -> Int? {
    var comparisonNumber = array.first!
    for int in array.dropFirst() {
        if int != comparisonNumber + 1 {
            return int
        } else {
            comparisonNumber = int
        }
    }
      return nil
    }
    
firstNonConsecutive(in: [1,2,3,5,7,8,9])
