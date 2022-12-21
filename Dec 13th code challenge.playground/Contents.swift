import UIKit

func dateBool(date: Date) _> Bool {
    return Calendar.current.isDateInToday(Date)
}

let day = Date().advanced(by: 12.days())

dateBool(date: day)
