//
//  SecondViewController.swift
//  Task_2.3.1
//
//  Created by Никита Бат on 26.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var welcomeTitle: UILabel!
    @IBOutlet var pandaImage: UIImageView!
    private var backColor: CAGradientLayer!
    
    var firstName: String!
    var lastName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        pandaImage.layer.cornerRadius = 75
        welcomeTitle.adjustsFontSizeToFitWidth = true
        
        if let firstName = firstName, let lastName = lastName {
            welcomeTitle.text = "Welcome, \(firstName) \(lastName)"
            self.tabBarItem.title = "\(firstName) \(lastName)"
        }
    }
    
}

extension SecondViewController {
    
    private func setGradientBackground() {
        
        let colorTop = UIColor(red: 0.0 / 255.0, green: 128 / 255.0, blue: 0.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override var shouldAutorotate: Bool {
        false
    }
}
