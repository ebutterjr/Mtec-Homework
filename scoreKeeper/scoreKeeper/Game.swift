//
//  Game.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/9/22.
//
import UIKit
import Foundation
struct Game {
    var title: String
    var description: String
    var image: UIImage?
   var athletes: [Athlete] = []
    static var games: [Game] = []
}
