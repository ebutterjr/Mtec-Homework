//
//  ViewController.swift
//  Calculator
//
//  Created by Easton Butterfield on 9/2/22.
//

import UIKit

class ViewController: UIViewController {
    var previousNumber: Double = 0
    var solution: Double = 0
    var currentNumber: Double = 0
    var currentOperation:String = "Placeholder"
    
    @IBOutlet var numberButtons: [UIButton]!
    
    @IBOutlet weak var displayNumber: UILabel!
    
    @IBOutlet weak var dot: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func percent(_ sender: Any) {
        currentNumber = Double(displayNumber.text!)!
        currentNumber = currentNumber / 100
        displayNumber.text = String(currentNumber)
    }
    @IBAction func negativeButton(_ sender: UIButton) {
        currentNumber = Double(displayNumber.text!)!
        currentNumber = currentNumber * -1
        displayNumber.text = String(currentNumber)
        }

    @IBAction func dotButton(_ sender: UIButton) {
       
        displayNumber.text = displayNumber.text! + "."
        currentNumber = currentNumber + 0.0
    }
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if currentNumber == 0 {
            displayNumber.text = sender.titleLabel?.text!
            currentNumber = Double((sender.titleLabel?.text!)!)!
            

            
        } else {
        guard let num = sender.titleLabel?.text else {return}
        displayNumber.text = displayNumber.text! + num
            currentNumber = currentNumber + Double(num)!
    }
    }
    @IBAction func clear(_ sender: Any) {
        displayNumber.text = "0"
        currentNumber = 0
        previousNumber = 0
        
    }
    
    @IBAction func plus(_ sender: UIButton) {
        currentOperation = "+"
//     solution = previousNumber + Double(displayNumber.text!)!
        previousNumber = Double(displayNumber.text!)!
        displayNumber.text = "0"
        currentNumber = 0
    }

    @IBAction func minus(_ sender: UIButton) {
       currentOperation = "-"
        previousNumber = Double(displayNumber.text!)!
        displayNumber.text = "0"
        currentNumber = 0
    }
    @IBAction func multiply(_ sender: Any) {
        currentOperation = "*"
         previousNumber = Double(displayNumber.text!)!
         displayNumber.text = "0"
         currentNumber = 0
    }
    

    
    @IBAction func divide(_ sender: Any) {
        currentOperation = "/"
         previousNumber = Double(displayNumber.text!)!
         displayNumber.text = "0"
         currentNumber = 0
    }
    
    @IBAction func equals(_ sender: Any) {
        switch currentOperation{
        case "+":
            solution = previousNumber + Double(displayNumber.text!)!
            
            displayNumber.text = String(solution)
            previousNumber = Double(displayNumber.text!)!
            currentNumber = 0
            
        case "-":
            solution = previousNumber - Double(displayNumber.text!)!
            
            displayNumber.text = String(solution)
            previousNumber = Double(displayNumber.text!)!
            currentNumber = 0
        case "*":
            solution = previousNumber * Double(displayNumber.text!)!
            
            displayNumber.text = String(solution)
            previousNumber = Double(displayNumber.text!)!
            currentNumber = 0
        case"/":
            solution = previousNumber / Double(displayNumber.text!)!
            
            displayNumber.text = String(solution)
            previousNumber = Double(displayNumber.text!)!
            currentNumber = 0
        default:
            print("hello")
        }
}
}



