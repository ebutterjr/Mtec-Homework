//
//  ViewController.swift
//  InterfaceBuilderControlActions
//
//  Created by Easton Butterfield on 9/1/22.
//

import UIKit

class ViewController: UIViewController {

   
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backgroundChangedSlider(_ sender: UISlider) {
        if sender.value > 0.6 {
            self.view.backgroundColor = .blue
        } else {
            self.view.backgroundColor = .white
        }
    }
    
}

