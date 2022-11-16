//
//  ViewController.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/3/22.
//

import UIKit

class AddAthleteViewController: UIViewController {
    
    @IBOutlet weak var athleteNameTextField: UITextField!
    
    @IBOutlet weak var athleteDescriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        Athlete.athletes.append(Athlete(name: athleteNameTextField.text ?? "", score: athleteDescriptionTextField.text ?? ""))
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
