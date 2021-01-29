//
//  SignUpDetailsViewController.swift
//  Agenda
//
//  Created by alumnos on 29/01/2021.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import UIKit

class SignUpDetailsViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var surnameTF: UITextField!
    
    var email:String?
    
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func confirmSignUpBT(_ sender: UIButton) {
        
        let user = User(username: usernameTF.text!, email: email!, name: nameTF.text!, surname: surnameTF.text!, profilePic: "", password: password!)
    
        Requests.shared.registerUser(user: user)
    }

}
