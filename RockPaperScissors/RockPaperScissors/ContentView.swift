//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Easton Butterfield on 1/17/23.
//

import SwiftUI

struct ContentView: View {
        // State variables to keep track of the current game state
        @State private var gameMoves = ["Rock", "Paper", "Scissors"]
        @State private var gameMove = ""
        @State private var gameObjective = "Win"
        @State private var playerMove = ""
        @State private var score = 0
        @State private var round = 1
        @State private var showAlert = false
        @State private var alertTitle = ""
        @State private var alertMessage = ""

        var body: some View {
            VStack {
                Text("Round: \(round)/10")
                Text("Score: \(score)")
                
                Text("The move is: \(gameMove)")
                Text("Your objective is to \(gameObjective)")
                
                HStack {
                    Button(action: {
                        self.playerMove = "Rock"
                        self.checkAnswer()
                    }) {
                        Text("Rock")
                    }
                    Button(action: {
                        self.playerMove = "Paper"
                        self.checkAnswer()
                    }) {
                        Text("Paper")
                    }
                    Button(action: {
                        self.playerMove = "Scissors"
                        self.checkAnswer()
                    }) {
                        Text("Scissors")
                    }
                }

                if round > 10 {
                    Text("Game Over! Your final score is \(score)")
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .onAppear(perform: startRound)
        }

        func startRound() {
            gameMove = gameMoves.randomElement()!
            gameObjective = Bool.random() ? "Win" : "Lose"
        }

        func checkAnswer() {
            if (gameMove == "Rock" && playerMove == "Scissors" && gameObjective == "Lose") ||
                (gameMove == "Paper" && playerMove == "Rock" && gameObjective == "Lose") ||
                (gameMove == "Scissors" && playerMove == "Paper" && gameObjective == "Lose") ||
                (gameMove == "Rock" && playerMove == "Paper" && gameObjective == "Win") ||
                (gameMove == "Paper" && playerMove == "Scissors" && gameObjective == "Win") ||
                (gameMove == "Scissors" && playerMove == "Rock" && gameObjective == "Win") {
                score += 1
                alertTitle = "Correct!"
                alertMessage = "You scored 1 point"
            } else {
                score -= 1
                alertTitle = "Wrong!"
                alertMessage = "You lost 1 point"
            }
            round += 1
            showAlert = true
            if round <= 10 {
                startRound()
            }
        }
    }

