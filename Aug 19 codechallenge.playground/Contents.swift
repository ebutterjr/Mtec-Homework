import UIKit

let name = "Brayden"
let age = 23
print("Hello \(name) who is \(age) years old")


func letterCount(word: String) -> Int {
    let result = word.count
    return result
}
let hello = letterCount( word: "Hello")

print(hello)
func wordCount(firstWords: Int, secondWords: Int) -> Int {
    let resultS = firstWords + secondWords
    return resultS
}
let wordCountA = wordCount(firstWords: 2, secondWords: 3)
print(wordCountA)
