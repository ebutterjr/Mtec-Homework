//
//  QuestionViewController.swift
//  Personality quiz
//
//  Created by Easton Butterfield on 9/29/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLable1: UILabel!
    @IBOutlet weak var multiLable2: UILabel!
    @IBOutlet weak var multiLable3: UILabel!
    @IBOutlet weak var multiLable4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedLable1: UILabel!
    @IBOutlet weak var rangedLable2: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    var answersChosen: [Answer] = []
    var questions: [Question] = [
        Question(
            text: "Whats your favorite activity",
            type: .single,
            answers: [
                Answer(text: "Amusment parks", type: .cp),
                Answer(text: "Video Games", type: .lc),
                Answer(text: "Hiking", type: .lf),
                Answer(text: "Watching tv", type: .fp)
            ]
        ),
        Question(
            text: "Which foods do you enjoy",
            type: .multiple,
            answers: [
                Answer(text: "Sushi", type: .lf),
                Answer(text: "Pasta", type: .cp),
                Answer(text: "Baked goods", type: .fp),
                Answer(text: "Pizza", type: .lc)
            ]
        ),
        Question(
            text: "Sweet or Savory?",
            type: .ranged,
            answers: [
                Answer(text: "Savory", type: .lf),
                Answer(text: "Sweet", type: .cp),
                Answer(text: "Sweet", type: .fp),
                Answer(text: "Sweet", type: .lc)
            ]
        )
    ]
    var questionIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
        // Do any additional setup after loading the view.
    }
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
   nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float (questions.count)
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLable.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLable1.text = answers[0].text
        multiLable2.text = answers[1].text
        multiLable3.text = answers[2].text
        multiLable4.text = answers[3].text
    }
    func updateRangedStack(using answers:[Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLable1.text = answers.first?.text
        rangedLable2.text = answers[1].text
    }
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    @IBSegueAction func showResults(_ coder: NSCoder) -> UIViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
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
