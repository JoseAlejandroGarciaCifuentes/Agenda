//
//  ViewController.swift
//  Agenda
//
//  Created by Alejandro García on 25/1/21.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirmedPass: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func OnFinishTypingEmail(_ sender: UITextField) {
        emailErrorLabel.isHidden = true
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        
        if checkEmail(textFieldEmail: textFieldEmail, errorLabel: emailErrorLabel)
        {
            let email = textFieldEmail.text!
            //let password = textFieldPassword.text!
            
            let user = User(username: "massatodonte", email: email, name: "arroba", surname: "gmail", profilePic: "")
            Requests.shared.postUsers(user: user)
            
        }
    }
    
}

