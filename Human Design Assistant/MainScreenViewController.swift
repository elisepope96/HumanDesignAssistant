//
//  MainScreenViewController.swift
//  Human Design Assistant
//
//  Created by Elise Pope on 10/10/19.
//  Copyright © 2019 Quantum Alignment System, LLC. All rights reserved.
//

import UIKit
import Firebase

class MainScreenViewController: UIViewController {
    
    let segueIdentifier = "LoginToMainSegueIdentifier"

    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)

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
