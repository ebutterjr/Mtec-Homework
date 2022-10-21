//
//  ViewController.swift
//  image test
//
//  Created by Easton Butterfield on 10/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func setImageButtonPressed(_ sender: Any) {
        ImagePickerManager().pickImage(self){ [self] image in
            imageTest.image = image
           }
    }
    
}

