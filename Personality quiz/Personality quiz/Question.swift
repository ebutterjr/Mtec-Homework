//
//  Question.swift
//  Personality quiz
//
//  Created by Easton Butterfield on 9/30/22.
//

import Foundation
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    var text: String
    var type: CerealType
}
enum CerealType: String {
    case fp = "FruityPebbles", cp = "CocoaPuffs", lc = "Lucky Charms", lf = "Life"

var definition: String {
    switch self {
    case .fp:
        return "You are a happy easy going person."
    case .cp:
        return "You are very energetic and excited."
    case .lc:
        return "You go with the flow and dont usually stick to the plan."
    case .lf:
        return "You are a healthy person and a smart thinker."
    }
}
}
