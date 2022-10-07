import UIKit
import Darwin

func triangle(a: Double, b: Double, c: Double) -> Double {
    var s : Double = 0
    s = (a+b+c) / 2
    return sqrt((s*(s - a)*(s-b)*(s-c)))
}
triangle(a: 7, b:4, c: 6)
