//
//  ResultsViewController.swift
//  Personality quiz
//
//  Created by Easton Butterfield on 9/29/22.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLable: UILabel!
    @IBOutlet weak var resultDefinitionLable: UILabel!
    var responses: [Answer]
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
calculatePersonalityResult()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
    }
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.sorted { $0.1 > $1.1 }.first!.key
        resultAnswerLable.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDefinitionLable.text = mostCommonAnswer.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

// self.dismiss(animated: true)
