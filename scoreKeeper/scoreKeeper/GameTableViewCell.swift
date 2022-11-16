//
//  GameTableViewCell.swift
//  scoreKeeper
//
//  Created by Easton Butterfield on 11/9/22.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var gameTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with game: Game) {
        gameImage.image = game.image
        gameTitle.text = game.title
    }
}
