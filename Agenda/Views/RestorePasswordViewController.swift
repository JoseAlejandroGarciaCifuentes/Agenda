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
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    
    @IBAction func ConfirmRestoring(_ sender: UIButton) {
        let parameters = [
            "email":textFieldEmail.text!
        ]
        
        Requests.shared.restorePassword(parameters: parameters)
    }
    
        
        
    
    
    

}
