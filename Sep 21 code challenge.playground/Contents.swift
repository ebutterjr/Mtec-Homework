import UIKit

func timeSinceMidnight(h: Int, m: Int, s: Int) -> Int {
   var newS = 0
    var newH = 0
    var newM = 0
    if s > 0 {
        newS = s * 1000
    }
    if m > 0{
        newM = m * 60000
    }
    if h > 0 {
        newH = h * 3_600_000
    }
    return newH + newM + newS
}

print(timeSinceMidnight(h: 1, m: 1, s: 1))
