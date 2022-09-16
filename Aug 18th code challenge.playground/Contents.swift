import UIKit

let color = "blue"
let number = 50
let letter = "a"

if color == "blue" {
    print("That is my favorite color")
}
else {
    print("cool")
}
if number < 100 && number > 0 {
    print("That is a valid number")
}
else {
    print("That is not a valid number")
}

switch letter {
case "a", "e", "i", "o", "u":
    print("letter is a vowel")
default:
    print("letter is a consonant")
}
