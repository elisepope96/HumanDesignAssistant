//
//  CreateAccountViewController.swift
//  Human Design Assistant
//
//  Created by Elise Pope on 10/10/19.
//  Copyright © 2019 Quantum Alignment System, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func createAccountPressed(_ sender: UIButton) {
        let error = validateFields()
        if error != nil{
            //was an error
            showError(error!)
        }
        else{
        
            let firstName = self.firstNameTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = self.lastNameTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = self.emailTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = self.passwordTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil{
                    self.showError("Error creating user")
                }
                else{
                    //store first/last name
                    
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstName": firstName, "lastName": lastName, "uid": result!.user.uid]) { (err) in
                        if err != nil{
                            self.showError("User data couldn't be added to Firestore")
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    
    func validateFields() -> String?{
        if firstNameTextField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        //add password validation
        return nil
        
    }
    
    func showError(_ message: String){
        errorMessageLabel.text = message
        errorMessageLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC")
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
