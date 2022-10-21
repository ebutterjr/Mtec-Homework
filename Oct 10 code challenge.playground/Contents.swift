import UIKit

func reverseSort(_ strings: [String]) -> [String]{
    var letters = strings
    let sortedLetters = letters.sorted { (lhs: String, rhs: String) -> Bool in
        return lhs > rhs
    }
    letters.sort { (lhs: String, rhs: String) -> Bool in
        return lhs > rhs
    }
    return sortedLetters
}
reverseSort(["Sal", "Jimmy", "Bob", "Tim"])

