import UIKit

func array(arrayOne: [Int], firstItems: Int) -> [Int] {
    var firstItemsArray : [Int] = []
    firstItemsArray += arrayOne
    
    return Array(arrayOne[..<firstItems])
}
array(arrayOne: [0,1,2,3,4], firstItems: 3)
