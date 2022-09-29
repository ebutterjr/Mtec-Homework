import UIKit

func findCentury(year: Double){
    let years: Double = year / 100
    if years.truncatingRemainder(dividingBy: 1) == 0 {
        print(years)
    } else {
        print (Int(years + 1))
    }
}
findCentury(year: 1601)
findCentury(year: 1600)
