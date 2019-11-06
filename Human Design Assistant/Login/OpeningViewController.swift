//
//  LoginViewController.swift
//  Human Design Assistant
//
//  Created by Elise Pope on 10/10/19.
//  Copyright © 2019 Quantum Alignment System, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth

class OpeningViewController: UIViewController{
    
    //let segueIdentifier = "LoginToMainSegueIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*@IBAction func LoginButtonPressed(_ sender: UIButton) {
        guard
            let email = email.text,
            let password = password.text,
            email.count > 0,
            password.count > 0
            else {
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error == nil{
              guard let strongSelf = self else { return }
            }
            else {
                //Tells the user that there is an error and then gets firebase to tell them the error
                let alert = UIAlertController(title: "Sign In Failed",
                    message: error?.localizedDescription,
                    preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default))

                self!.present(alert, animated: true, completion: nil)
            }
        }
    }*/
    
    func textFieldShouldReturn(textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // Clean up fields
        /*email.text = nil
        password.text = nil*/
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
