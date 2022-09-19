//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Easton Butterfield on 9/19/22.
//

import UIKit

class MiddleViewController: UIViewController {
    @IBOutlet var middleViewControl: UIView!
    
    @IBOutlet var middleLable: UILabel!
    var eventNumber: Int = 1
    
    func addEvent (from: String) {
        if let existingText = middleLable.text {
            middleLable.text = "\(existingText)\nEvent number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "viewWillApear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "viewDidDissapear")
    }
}


