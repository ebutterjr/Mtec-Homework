//
//  ViewController.swift
//  2.10 Controls in Action
//
//  Created by Easton Butterfield on 8/31/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet var label: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        self.label.text = textField.text
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        self.label.text = ""
    }
    
}

