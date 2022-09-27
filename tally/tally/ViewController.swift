//
//  ViewController.swift
//  tally
//
//  Created by Easton Butterfield on 9/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var incrementNumber: UILabel!
    var currentIncrement: Int = 0
    @IBOutlet weak var displayNumber: UILabel!
    var currentCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func bottomPlusButtonPressed(_ sender: Any) {
        currentCount = Int(incrementNumber.text!)! + Int(displayNumber.text!)!
        displayNumber.text = String(currentCount)
    }
    
    @IBAction func bottomMinusPressed(_ sender: Any) {
        currentCount = Int(displayNumber.text!)! - Int(incrementNumber.text!)!
        displayNumber.text = String(currentCount)
    }
    @IBAction func increaseIncrement(_ sender: Any) {
        currentIncrement = Int(incrementNumber.text!)! + 1
        incrementNumber.text = String(currentIncrement)
    }
    
    @IBAction func decreaseIncrement(_ sender: Any) {
        currentIncrement = Int(incrementNumber.text!)! - 1
        incrementNumber.text = String(currentIncrement)
    }
}

