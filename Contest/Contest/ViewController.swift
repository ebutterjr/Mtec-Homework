//
//  ViewController.swift
//  Contest
//
//  Created by Easton Butterfield on 12/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text else {return}
        if isValidEmail(email) == true {
            self.performSegue(withIdentifier: "submit", sender: sender)
        } else {
            UITextField.animate(withDuration: 0.5, animations: {
                let rotate = CGAffineTransform(rotationAngle: 50)
                self.emailTextField.transform = rotate
            }) { (_) in
                UITextField.animate(withDuration: 0.25, animations: {
                    self.emailTextField.transform = CGAffineTransform.identity
                })
            }
                                    
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
      }
}

