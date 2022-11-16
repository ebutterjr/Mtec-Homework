//
//  PostCreateTableViewController.swift
//  year long projecct
//
//  Created by Easton Butterfield on 11/1/22.
//

import UIKit

class PostCreateTableViewController: UITableViewController {
    @IBOutlet weak var addTitleLableTextField: UITextField!
    
    @IBOutlet weak var addDescriptionLableTextField: UITextField!
    
    @IBOutlet weak var chooseImageButtonPressed: UIButton!
    
    @IBOutlet weak var imagePickedDisplay: UIImageView!
    
    init?(coder: NSCoder, post: Post?) {
        self.posts = post
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    var posts: Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let posts = posts {
            addTitleLableTextField.text = posts.title
            addDescriptionLableTextField.text = posts.description
            imagePickedDisplay.image = posts.imageName
            
            title = "Edit Post"
        } else {
            title = "Add Post"
            
        }
        
        
    }
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        Post.posts.append(Post(title: addTitleLableTextField.text ?? "", description: addDescriptionLableTextField.text ?? "", imageName: imagePickedDisplay.image))
        dismiss(animated: true)
    }
    
    @IBAction func chooseImageButtonPressed(_ sender: UIButton) {
        ImagePickerManager().pickImage(self){ [self] image in
            imagePickedDisplay.image = image
        }
    }
}
