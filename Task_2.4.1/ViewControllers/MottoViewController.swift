    //
    //  MottoViewController.swift
    //  Task_2.4.1
    //
    //  Created by Никита Бат on 29.10.2021.
    //

import UIKit

class MottoViewController: UIViewController {
    
    @IBOutlet var mottoLabel: UILabel!
    
    var motto: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        if let motto = motto {
            mottoLabel.text = "\(motto)"
        }
    }
    
}

extension MottoViewController {
    
    private func setGradientBackground() {
        let colorTop = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        
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
