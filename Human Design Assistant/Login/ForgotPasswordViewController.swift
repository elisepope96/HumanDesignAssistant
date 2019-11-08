//
//  ForgotPasswordViewController.swift
//  Human Design Assistant
//
//  Created by Elise Pope on 10/10/19.
//  Copyright © 2019 Quantum Alignment System, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.alpha = 0
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        guard
            email.count > 0
        else{
            showError("Please enter an email")
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (err) in
            if err != nil{ self.showError(err!.localizedDescription)
            }
        }
    }
    
    func showError(_ message: String){
        errorMessageLabel.text = message
        errorMessageLabel.alpha = 1
    }

}
