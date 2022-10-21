import UIKit

func occurence(sentance: String) -> [String:Int] {
    let sentanceArray = sentance.split(separator: " ")
    var result: [String: Int] = [:]
    for word in sentanceArray {
        if result[String(word)] != nil {
            result[String(word)] = result[String(word)]! + 1
        } else {
            result[String(word)] = 1
        }
    }
    return result
}
occurence(sentance: "test test test asdf asf")
