import UIKit

func timeString(hr: Int, fiveMin: Int, minute: Int) -> String {
    var time = 0
    var fiveMinutes = 0
    fiveMinutes = fiveMin * 5
    time = fiveMinutes + minute
    if time < 10 {
        return ("\(hr):0\(time)")
    } else {
        return ("\(hr):\(time)")
    }
}
timeString(hr: 2, fiveMin: 1, minute: 2)
