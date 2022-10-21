//
//  ViewController.swift
//  ISpy
//
//  Created by Easton Butterfield on 10/19/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var twentyFive: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateZoomSizeFor(size: view.bounds.size)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return twentyFive
    }
    func updateZoomSizeFor(size: CGSize) {
        let widthScale = size.width / twentyFive.bounds.width
        let heightScale = size.height / twentyFive.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
       
    }
}

