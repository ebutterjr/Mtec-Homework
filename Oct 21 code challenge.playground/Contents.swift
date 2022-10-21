import UIKit

func pluralFinder(pluralArr: [String]) {
    var arr: [String] = []
    for entry in pluralArr {
        if entry.last == "s" {
            arr.append(entry)
        }
    }
    print(arr)
}
pluralFinder(pluralArr: ["cats", "dogs", "horses", "cheese"])
