import UIKit
extension String {
    func isPalindrome() -> Bool {
        let modified = self.lowercased()
        return String(modified.reversed()) == modified
        
    }
}
    
    let strings = ["racecar", "dad", "golf", "mom"]
    for string in strings {
        print("\(string) - \(string.isPalindrome())")
    }

