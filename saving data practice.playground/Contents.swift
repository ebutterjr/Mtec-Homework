import UIKit

struct BallCount: Codable {
    var hr: Int
    var fiveMin: Int
    var min: Int
}

// MARK - SAVE TO FILE:

let currentBallCount = BallCount(hr: 8, fiveMin: 8, min: 0)

let dataObject = try! JSONEncoder().encode(currentBallCount)

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let saveFileURL = documentsDirectory.appendingPathComponent("BallCountData").appendingPathExtension("json")

do {
    try dataObject.write(to: saveFileURL)
} catch {
    print(error)
}


// MARK: - READ FROM FILE:

let data = try! Data(contentsOf: saveFileURL)
let newBallCount = try JSONDecoder().decode(BallCount.self, from: data)
 
