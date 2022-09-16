//
//  ViewController.swift
//  Login
//
//  Created by Easton Butterfield on 9/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var forgotPassword: UIButton!
    @IBOutlet var forgotUsername: UIButton!
    @IBOutlet var usernameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = usernameText.text
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgor Password"
        } else if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgor Username"
        } else {
            segue.destination.navigationItem.title = usernameText.text
        }
    }
    @IBAction func forgotPass(_ sender: Any) {
  performSegue(withIdentifier: "forgotSegue", sender: sender)
    
    }
    @IBAction func forgotUser(_ sender: Any) {
    performSegue(withIdentifier: "forgotSegue", sender: sender)
    
    }
    
    }


