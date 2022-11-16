//
//  ViewController.swift
//  year long projecct
//
//  Created by Easton Butterfield on 10/5/22.
//

import UIKit
//protocol SubmitPostable {
//    func submitNewPost(title: String?, body: String?, images: UIImage?)
//}
class ViewController: UIViewController {
    //                        SubmitPostable {
    
    
    
    
    @IBOutlet weak var profilePic: UIImageView!
    
    
    var isEditingText:Bool = false
    @IBOutlet weak var aboutMeTextField: UITextField!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var aboutMeView: UIView!
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var postsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        postView.isHidden = true
        aboutMeTextField.isHidden = true
    }
    @IBAction func aboutMeButtonPressed(_ sender: UIButton) {
        postView.isHidden = true
        aboutMeView.isHidden = false
        postsButton.backgroundColor = .clear
        aboutMeButton.backgroundColor = .lightGray
    }
    
    @IBAction func postsButtonPressed(_ sender: UIButton) {
        aboutMeView.isHidden = true
        postView.isHidden = false
        aboutMeButton.backgroundColor = .clear
        postsButton.backgroundColor = .lightGray
    }
    
    @IBAction func editDescriptionButtonPressed(_ sender: UIButton) {
        if isEditingText == false {
            isEditingText = true
            aboutMeTextField.isHidden = false
            descriptionText.isHidden = true
        } else {
            isEditingText = false
            descriptionText.text = aboutMeTextField.text
            aboutMeTextField.isHidden = true
            descriptionText.isHidden = false
        }
        
    }
    
    @IBAction func changeImageButtonPressed(_ sender: Any) {
        ImagePickerManager().pickImage(self){ [self] image in
            profilePic.image = image
        }
    }
    
    //    func submitNewPost(title: String?, body: String?, images: UIImage?) {
    //        postTitleLabel.text = title
    //        postDescriptionLabel.text = body
    //        postImageView.image = images
    //        postStackView.isHidden = false
    //    }
    //    @IBSegueAction func segueVC2(_ coder: NSCoder) -> ViewControllerTwo? {
    //        let vc2 = ViewControllerTwo(coder: coder)
    //        vc2?.delegate = self
    //
    //        return vc2
    //    }
    //}
    
//    class ViewControllerTwo: UIViewController {
//        @IBOutlet weak var newTitle: UITextField!
//        @IBOutlet weak var newImage: UIImageView!
//        @IBOutlet weak var newDescription: UITextField!
//        var delegate: SubmitPostable?
//
//        @IBAction func submitPostButtonPressed(_ sender: UIButton) {
//            delegate?.submitNewPost(title: newTitle.text, body: newDescription.text, images: newImage.image)
//            navigationController?.popViewController(animated: true)
//        }
//        @IBAction func postAddImagePressed(_ sender: Any) {
//            ImagePickerManager().pickImage(self){ [self] image in
//                newImage.image = image
//            }
//        }
//    }
}


