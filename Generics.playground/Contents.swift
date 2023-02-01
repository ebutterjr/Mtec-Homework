import UIKit

func checkArray<T: Equatable>(a: [T], x: T) -> Bool{
    for item in a {
        if item == x {
            return true
        }
    }
    return false
}
