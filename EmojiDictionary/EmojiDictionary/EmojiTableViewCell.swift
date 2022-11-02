//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Easton Butterfield on 10/19/22.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet weak var emojiLable: UILabel!
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func update(with emoji: Emoji) {
        emojiLable.text = emoji.symbol
        nameLable.text = emoji.name
        descriptionLable.text = emoji.description
    }
  
}
