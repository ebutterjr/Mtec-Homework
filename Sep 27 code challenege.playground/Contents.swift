import UIKit

func gpa(grade: [Double]) -> Int {
    let sum = grade.reduce(0, +)
    var gradeAverage: Double = 0
    gradeAverage = sum / Double(grade.count)
return Int(gradeAverage)
}
gpa(grade: [3,3,4,3,2,1])
