//
//  AthletesTableViewCell.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/3/22.
//

import UIKit
protocol Stepperable {
    func stepperSortValue(athlete: Athlete)
}
class AthletesTableViewCell: UITableViewCell {
    var delegate: Stepperable?
    var athlete: Athlete?
    @IBOutlet weak var athleteStepper: UIStepper!
    @IBOutlet weak var athleteNameLable: UILabel!
    
    @IBOutlet weak var athleteScoreLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateWithStepper()
        delegate?.stepperSortValue(athlete: athlete!)
    }
    func updateWithStepper() {
        athleteScoreLable.text = "\(Int(athleteStepper.value))"
        athlete?.score = "\(Int(athleteStepper.value))"
    }
    func update(with athlete: Athlete ) {
        athleteNameLable.text = athlete.name
        athleteScoreLable.text = athlete.score
        athleteStepper.value = Double(athlete.score) ?? 0
        self.athlete = athlete
    }
}
