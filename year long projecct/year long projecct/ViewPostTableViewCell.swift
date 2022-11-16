//
//  ViewPostTableViewCell.swift
//  year long projecct
//
//  Created by Easton Butterfield on 11/1/22.
//

import UIKit

class ViewPostTableViewCell: UITableViewCell {

    @IBOutlet weak var titlePostLable: UILabel!
    
    @IBOutlet weak var descriptionPostLable: UILabel!
    
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func update(with post: Post) {
        titlePostLable.text = post.title
        descriptionPostLable.text = post.description
        postImageView.image = post.imageName
    }
    
        

}
