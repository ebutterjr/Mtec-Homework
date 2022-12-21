//
//  ViewController.swift
//  NASAPictureOfTheDay
//
//  Created by Easton Butterfield on 11/30/22.
//

import UIKit
@MainActor
class ViewController: UIViewController {
    
    @IBOutlet weak var nasaImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let controller = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = ""
        nasaImageView.image = UIImage(systemName: "photo.on.rectangle")
        descriptionLabel.text = ""
        titleLabel.text = ""
        Task {
            do {
                let photoInfo = try await controller.fetchPhotoInfo()
                updateUI(with: photoInfo)
            } catch {
                updateUI(with: error)
            }
        }
        
        func updateUI(with photoInfo: PhotoInfo) {
            Task {
                do {
                    let image = try await controller.fetchImage(from:
                       photoInfo.url)
                    title = photoInfo.title
                    nasaImageView.image = image
                    descriptionLabel.text = photoInfo.description
                    titleLabel.text = photoInfo.title
                } catch {
                    updateUI(with: error)
                }
            }
        }
        
        func updateUI(with error: Error) {
            title = "Error Fetching Photo"
            nasaImageView.image = UIImage(systemName: "exclamationmark.octagon")
            descriptionLabel.text = error.localizedDescription
            titleLabel.text = ""
        }
    }
}



