import UIKit

func getGrade(s1: Int, s2: Int, s3: Int) -> String {
    var gradeAverage = 0
    guard s1 > 0,
        s1 < 100,
        s2 > 0,
        s2 < 100,
         s3 > 0,
           s3 < 100 else{
        return "0"
        
    }
    gradeAverage = (s1 + s2 + s3) / 3
        return String(gradeAverage)
    
    
    }

getGrade(s1: 90, s2: 90, s3: 28)
