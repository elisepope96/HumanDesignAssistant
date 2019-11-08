//
//  LoginViewController.swift
//  Human Design Assistant
//
//  Created by Elise Pope on 10/31/19.
//  Copyright © 2019 Quantum Alignment System, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let error = validateFields()
        if error != nil{
            //was an error
            showError(error!)
        }
        let email = self.emailTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = self.passwordTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard
            email.count > 0,
            password.count > 0
            else {
                errorMessageLabel.text = "Please enter a username and password"
                errorMessageLabel.alpha = 1
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error == nil{
              guard let strongSelf = self else { return }
                self!.transitionToHome()
            }
            else {
                self!.showError(error!.localizedDescription)
                
            }
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // Clean up fields
        emailTextField.text = nil
        passwordTextField.text = nil
    }
    

    func validateFields() -> String?{
        if emailTextField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        //add password validation
        return nil
        
    }
    
    func transitionToHome() {
           let homeViewController = storyboard?.instantiateViewController(identifier: "HomeTabBarController")
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
       }
    
    func showError(_ message: String){
        errorMessageLabel.text = message
        errorMessageLabel.alpha = 1
    }
}
