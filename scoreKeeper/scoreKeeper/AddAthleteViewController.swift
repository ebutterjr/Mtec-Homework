//
//  ViewController.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/3/22.
//

import UIKit
protocol AddAthleteViewControllerDelegate {
    func didAddAthlete(athlete: Athlete)
}
class AddAthleteViewController: UIViewController {
    var delegate: AddAthleteViewControllerDelegate?
    @IBOutlet weak var athleteNameTextField: UITextField!
    
    @IBOutlet weak var athleteDescriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        delegate?.didAddAthlete(athlete: Athlete(name: athleteNameTextField.text ?? "", score: athleteDescriptionTextField.text ?? ""))
        navigationController?.popViewController(animated: true)
    }
    
    
}
