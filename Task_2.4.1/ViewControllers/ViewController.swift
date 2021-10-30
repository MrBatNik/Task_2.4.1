//
//  ViewController.swift
//  Task_2.3.1
//
//  Created by Никита Бат on 26.10.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let user = Users.creatUser()
    
    @IBOutlet var userTitle: UITextField!
    @IBOutlet var passwordTitle: UITextField!
    
    @IBOutlet var userReminder: UIButton!
    @IBOutlet var passwordReminder: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTitle.delegate = self
        passwordTitle.delegate = self
        passwordTitle.enablesReturnKeyAutomatically = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 5
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTitle.resignFirstResponder()
        
        if userTitle.hasText {
            passwordTitle.becomeFirstResponder()
        }
        
        if passwordTitle.isFirstResponder && passwordTitle.hasText {
            logInTap()
        }
        
        return true
    }

    @IBAction func logInTap() {
        if userTitle.text == user.userName && passwordTitle.text == user.password {
            performSegue(withIdentifier: "welcomePage", sender: nil)
        } else {
            alerController(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        
        for viewController in tabBarController.children {
            if let welcomeViewController = viewController as? SecondViewController {
                welcomeViewController.firstName = user.firstName
                welcomeViewController.lastName = user.lastName
            } else if let navigationViewController = viewController as? UINavigationController {
                let mottoViewController = navigationViewController.topViewController as! MottoViewController
                mottoViewController.motto = user.motto
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTitle.text = ""
        passwordTitle.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func userReminderTap() {
        alerController(title: "Oops!", message: "Your name is User 😉")
    }
    
    @IBAction func passwordReminderTap() {
        alerController(title: "Oops!", message: "Your password is Password 😉")
    }
    
}

extension ViewController {
    
    private func alerController(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTitle.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
