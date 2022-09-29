import UIKit

func money(number: Double) -> String {
    return String(format: "$%.2f", number)
}

money(number: 3.1)
