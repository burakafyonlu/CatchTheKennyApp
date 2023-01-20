//
//  ViewController.swift
//  deneme
//
//  Created by Burak Afyonlu on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var passwordAgainLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(keyboard)
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if userNameLabel.text == "" {
            
            let alert = UIAlertController(title: "Error", message: "Enter Username", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        else {            let password1 = passwordLabel.text
            let password2 = passwordAgainLabel.text
            
            if password1 == "" {
                let alert = UIAlertController(title: "Error", message: "Enter Password", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }   else {
                if password2 == "" {
                    let alert = UIAlertController(title: "Error", message: "Enter Password Again", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
                    alert.addAction(okButton)
                    self.present(alert, animated: true)
                }   else {
                    
                    if password1 != password2 {
                        
                        let alert = UIAlertController(title: "Error", message: "Password not match", preferredStyle: UIAlertController.Style.alert)
                        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
                        alert.addAction(okButton)
                        self.present(alert, animated: true)
                    }
                    else {
                        
                        let alert = UIAlertController(title: "COMPLETED", message: "Successfully Registered", preferredStyle: UIAlertController.Style.alert)
                        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                            
                            self.performSegue(withIdentifier: "ToSecondVC", sender: self)
                        }
                        alert.addAction(okButton)
                        self.present(alert, animated: true)
                        
                    }
                }
            }
        }
    }
}
