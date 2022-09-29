import UIKit

func differenceInVolume(cubeOne: [Int], cubeTwo: [Int] ) -> Int? {
    if cubeOne.count != 3 {
        return nil
    }
    if cubeTwo.count != 3 {
        return nil
    }
    var valueOne = 1
    var valueTwo = 1
    var finalValue: Int
    for number in cubeOne {
        if number > 0 {
            valueOne *= number
        } else {
            return nil
        }
    }
    for numberOne in cubeTwo {
        if numberOne > 0 {
            valueTwo *= numberOne
        } else {
            return nil
            
        }
    }
    if valueOne > valueTwo {
        finalValue = valueOne - valueTwo
    } else {
        finalValue = valueTwo - valueOne
    }
    return finalValue
}

differenceInVolume(cubeOne: [2,3,3], cubeTwo: [5,4,1])
