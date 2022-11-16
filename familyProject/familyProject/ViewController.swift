//
//  ViewController.swift
//  familyProject
//
//  Created by Easton Butterfield on 9/26/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var member: FamilyMember?
    
    override func viewDidLoad() {
        guard let member = member else {
            fatalError()
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = member.name
        descriptionLabel.text = member.description
        imageView.image = UIImage(named: member.imageName)
    }
    
}

