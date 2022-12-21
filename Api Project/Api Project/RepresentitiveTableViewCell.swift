//
//  RepresentitiveTableViewCell.swift
//  Api Project
//
//  Created by Easton Butterfield on 12/8/22.
//

import UIKit

class RepresentitiveTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with representitive: RepresentitiveTableViewController.Representative) {
        nameLabel.text = representitive.name
        partyLabel.text = representitive.office
        linkLabel.text = representitive.link
    }
}
