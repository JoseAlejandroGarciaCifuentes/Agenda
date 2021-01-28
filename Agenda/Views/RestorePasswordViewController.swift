//
//  RestorePasswordViewController.swift
//  Agenda
//
//  Created by alumnos on 27/01/2021.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import UIKit

class RestorePasswordViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    
    @IBAction func ConfirmRestoring(_ sender: UIButton) {
        let parameters = [
            "email":textFieldEmail.text!]
        print(parameters)
        Requests.shared.restorePassword(parameters: parameters)
    }
    
        
        
    
    
    

}
