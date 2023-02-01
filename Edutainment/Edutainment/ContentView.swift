//
//  ContentView.swift
//  Edutainment
//
//  Created by Easton Butterfield on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    // State variables to store selected range, number of questions and the current question
    @State private var selectedRange = 2
    @State private var selectedQuestions = 10
    @State private var currentQuestion = 0
    @State private var questions: [String] = []
    @State private var answers: [Int] = []
    @State private var showQuestionView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Stepper to select range
                Stepper("From 1 to \(selectedRange)", value: $selectedRange, in: 2...12)
                // Textfield to select number of questions
                Stepper("Number of questions \(selectedQuestions)", value: $selectedQuestions,in: 1...20)
                // Button to start the game
                Button("Start Game") {
                    self.startGame()
                }
                NavigationLink(destination: QuestionView(questions: self.$questions, currentQuestion: self.$currentQuestion, answers: self.$answers), isActive: self.$showQuestionView) {
                    EmptyView()
                }
            }
        }
    }

    func startGame() {
        // Use a loop to generate the number of questions selected
        for _ in 1...selectedQuestions {
            // Use a random number generator to select a table and two numbers
            let table = Int.random(in: 2...selectedRange)
            let num1 = Int.random(in: 2...selectedRange)

            // Create the question and add it to the array
            let question = "\(num1) x \(table) = ?"
            let answer = num1 * table
            answers.append(answer)
            questions.append(question)
        }
        self.showQuestionView = true
    }
}

struct QuestionView: View {
    @Binding var questions: [(String)]
    @Binding var currentQuestion: Int
    @Binding var answers: [(Int)]
    @State private var studentAnswer = ""
    @State private var showAnswer = false
    @State private var isLastQuestion = false
    @State private var isCorrect: Bool? = nil
    var body: some View {
        VStack {
            if isLastQuestion {
                Text("Congratulations! You have completed the practice")
            } else {
                Text(questions[currentQuestion])
                TextField("Enter your answer", text: $studentAnswer)
                    .keyboardType(.numberPad)
                Button("Submit") {
                     isCorrect = self.checkAnswer()
                  
                    if self.currentQuestion < self.questions.count - 1 {
                        self.currentQuestion += 1
                    } else {
                       isLastQuestion = true
                    }
                }
                if let isCorrect = isCorrect {
                    if isCorrect {
                        Text("Correct")
                    } else {
                        Text("Incorrect")
                    }
                    
                }
            }
            
            
            
        }
        
    }
    func checkAnswer() -> Bool {
        self.showAnswer = true
        let currentAnswer = answers[currentQuestion]
        if (Int)(studentAnswer)! == currentAnswer {
            return true
        } else {
            return false
        }
    }
}
