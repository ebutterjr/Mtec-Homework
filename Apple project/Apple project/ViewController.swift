//
//  ViewController.swift
//  Apple project
//
//  Created by Easton Butterfield on 9/13/22.
//

import UIKit

class ViewController: UIViewController {
var listOfWords = ["word", "words", "morewords", "triangle"]
    let inCorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreBoard: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var currentGame: Game!
    func enableLetterButtons(_ enable:Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    func newRound() {
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: inCorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
    updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreBoard.text = "Wins \(totalWins), Losses:  \(totalLosses)"
        treeImageView.image = UIImage (named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
        // Do any additional setup after loading the view.


    @IBAction func letterButtonPressed(_ sender: UIButton) {
    sender.isEnabled = false
        let letterString = sender.titleLabel?.text!
        let letter = Character((letterString?.lowercased())!)
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
}

