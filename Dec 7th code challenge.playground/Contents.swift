import UIKit

func animalYears(humanYears: Int) -> [Int] {
    var catYears: Int = 0
    var dogYears: Int = 0
    var ages: [Int] = [humanYears]
    if humanYears == 1 {
        catYears = 15
    } else if humanYears == 2 {
        catYears = 24
    } else if humanYears < 2 {
        catYears = 24 + (4*(humanYears - 2))
    }
    ages.append(catYears)
    if humanYears == 1 {
        dogYears = 15
    } else if humanYears == 2 {
        dogYears = 24
    } else if humanYears < 2 {
        dogYears = 24 + (5*(humanYears - 2))
    }
    ages.append(dogYears)
    return ages
}
animalYears(humanYears: 2)
