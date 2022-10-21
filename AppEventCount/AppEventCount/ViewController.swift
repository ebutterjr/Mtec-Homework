//
//  ViewController.swift
//  AppEventCount
//
//  Created by Easton Butterfield on 10/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var didFinishLaunchingWithOptions: UILabel!
    @IBOutlet weak var configurationForConnecting: UILabel!
    
    @IBOutlet weak var willConnectTo: UILabel!
    @IBOutlet weak var sceneDidBecomeActive: UILabel!
    @IBOutlet weak var sceneWillResignActive: UILabel!
    @IBOutlet weak var sceneWillEnterForeground: UILabel!
    @IBOutlet weak var sceneDidEnterBackground: UILabel!
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var didFinishLaunchingWithOptionsCount = 0
    var configurationForConnectingCount = 0
    var willConnectToCount = 0
    var sceneDidBecomeActiveCount = 0
    var sceneWillResignActiveCount = 0
    var sceneWillEnterForegroundCount = 0
    var sceneDidEnterBackgroundCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        }

    func updateView() {
        didFinishLaunchingWithOptions.text = "The app has launched \(appDelegate.launchCount) time(s)"
        configurationForConnecting.text = "The app has launched \(appDelegate.configurationForConnectingCount) time(s)"
        willConnectTo.text = "The app has launched \(willConnectToCount) time(s)"
        sceneDidBecomeActive.text = "The app has launched \(sceneDidBecomeActiveCount) time(s)"
        sceneWillResignActive.text = "The app has launched \(sceneWillResignActiveCount) time(s)"
        sceneWillEnterForeground.text = "The app has launched \(sceneWillEnterForegroundCount) time(s)"
        sceneDidEnterBackground.text = "The app has launched \(sceneDidEnterBackgroundCount) time(s)"
    }
}

