//
//  GameViewController.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/9/22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var gameSampleImageView: UIImageView!
    @IBOutlet weak var gameDescriptionTextField: UITextField!
    @IBOutlet weak var gameTitleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func chooseImageButtonPressed(_ sender: UIButton) {
        ImagePickerManager().pickImage(self){ [self] image in
            gameSampleImageView.image = image
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        Game.games.append(Game(title: gameTitleTextField.text ?? "", description: gameDescriptionTextField.text ?? "", image: gameSampleImageView.image))
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
