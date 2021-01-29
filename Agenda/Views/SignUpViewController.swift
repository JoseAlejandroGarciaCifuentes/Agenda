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
            self.performSegue(withIdentifier: "signup", sender: sender)
            print("que paso")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "signup"){
            let controller = segue.destination as! SignUpDetailsViewController
            controller.email = textFieldEmail.text!
            controller.password = textFieldPassword.text!
            
        }
        
    }
    
}

