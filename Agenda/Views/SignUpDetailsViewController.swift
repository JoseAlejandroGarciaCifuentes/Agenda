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
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func confirmSignUpBT(_ sender: UIButton) {
        
        let user = User(username: usernameTF.text!, email: email!, name: nameTF.text!, surname: surnameTF.text!, profilePic: Images.shared.pictures[Int.random(in: 0..<Images.shared.pictures.count)], password: password!)
    
        let request = Requests.shared.registerUser(user: user)
        
        request.responseJSON { (response) in
            print(response.value!)
            if(response.value! as! String == "Usuario registrado"){
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
    }

}
