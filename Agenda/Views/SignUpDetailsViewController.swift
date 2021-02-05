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
        //Esconde teclado al hacer tap en la pantalla
        self.hideKeyboardWhenTappedAround()
    }

    /**
     Al pulsar el boton de confirmar registro comprueba que los fields no esten vacios, muestran mensaje en label y hacen animacion en caso de estarlo.
     Si todo va bien envia el usuario por param de petición y lo añade a la base de datos
     Además te lleva de vuelta la pantalla root o login
     */
    @IBAction func confirmSignUpBT(_ sender: UIButton) {
        
        if checkUsername(textFieldUsername: usernameTF) && checkName(textFieldName: nameTF) && checkSurname(textFieldSurname: surnameTF){
            let images = Images.shared
            let user = User(username: usernameTF.text!, email: email!, name: nameTF.text!, surname: surnameTF.text!, profilePic: images.pictures[Random.shared.getRandom(max: images.pictures.count)], password: password!)
        
            let request = Requests.shared.registerUser(user: user)
            
            request.responseJSON { (response) in
                if(response.value! as! String == "Usuario registrado"){
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
        
    }

}
