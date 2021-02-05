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
    @IBOutlet weak var restorePassErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Esconde teclado al hacer tap en la pantalla
        self.hideKeyboardWhenTappedAround()
    }
    
    /**
     Al mostrarse la pantalla el nav controller aparece
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /**
     Botón confirmar realiza peticion que genera una nueva contraseña para el usuario pasado por el textfield
     */
    @IBAction func ConfirmRestoring(_ sender: UIButton) {
        
        if checkEmail(textFieldEmail: textFieldEmail, errorLabel: restorePassErrorLabel) {
         
            let parameters = [
                ApiBodyNames.shared.email:textFieldEmail.text!
            ]
            
            Requests.shared.restorePassword(parameters: parameters)
        }
    }
    
        
        
    
    
    

}
