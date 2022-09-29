//
//  ViewController.swift
//  textVaildation
//
//  Created by Easton Butterfield on 9/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: Any) {
        let password = checkPassword(pass: passwordInput.text!)
        if password == false {
            let alert = UIAlertController(title: "Invalid Password", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
          let alert =  UIAlertController(title: "Success", message: "Logged in.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func checkPassword(pass: String) -> Bool {
        let passwordReg = ("(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,}")
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTest.evaluate(with: pass)
    }
}

