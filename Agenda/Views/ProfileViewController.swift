//
//  ProfileViewController.swift
//  Agenda
//
//  Created by Alejandro García on 2/2/21.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var profilePicIV: UIImageView!
    
    @IBOutlet weak var newPassErrorLabel: UILabel!
    var user: User?
    
    let identifiers = Identifiers.shared
    let requests = Requests.shared
    
    /**
    Al mostrarse la pantalla el nav controller aparece
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        newPassErrorLabel.isHidden = true
        passwordField.text = ""
    }
    
    /**
     Al entrar en la screen comprueba que la variable de api token este rellena en user defaults
     Si lo está, hace request de recoger info del usuario pasando el token por headers y la muestra en los labels además de la imagen
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let api_token:String = UserDefaults.standard.string(forKey: identifiers.apiToken){
            let request = requests.getProfileInfo(api_token: api_token)
            
            request.response { (responseData) in
            
            guard let data = responseData.data else {return}
            
                do{
                    
                    self.user = try JSONDecoder().decode(User.self, from: data)
                    self.nameLabel.text = self.user!.name
                    self.surnameLabel.text = self.user!.surname
                    self.emailLabel.text = self.user!.email
                    self.usernameLabel.text = self.user!.username
                    
                    let requestImage = self.requests.downloadImage(url: self.user!.profilePic)
                    requestImage.response{ response in

                        switch response.result {
                             case .success(let responseData):
                                 self.profilePicIV.image = UIImage(data: responseData!, scale:1)

                             case .failure(let error):
                                 print("error--->",error)
                        }
                    }
                    
                }catch{
                    print("Error decoding == \(error)")
                }
            
            }
            
            
        }
        
    }
    /**
     Al puelsar el botón de actualizar contraseña comprueba que la api este en user defaults
     Si lo está hace llamada de actualización de usuario enviando new pass por param y api token por header
     */
    @IBAction func updatePassBT(_ sender: UIButton) {
        
        if checkPassword(textFieldPass: passwordField, errorLabel: newPassErrorLabel){
            
            if let api_token:String = UserDefaults.standard.string(forKey: identifiers.apiToken)
            {
                let request = requests.updatePassword(password: passwordField.text!, api_token: api_token)
                
                request.responseJSON { (response) in
                    debugPrint(response)
                    self.newPassErrorLabel.text = UserMessages.shared.passwordChanged
                    self.newPassErrorLabel.isHidden = false
                    self.newPassErrorLabel.textColor = #colorLiteral(red: 0.262745098, green: 0.8509803922, blue: 0.7411764706, alpha: 1)
                }
                
            }
            
        }
    }
    
    /**
     Al pulsar el botón de delete comprueba que api token esté en user defaults
     si lo está hace peticion de borrar user pasando api token
     */
    @IBAction func deleteBT(_ sender: UIButton) {
        if let api_token:String = UserDefaults.standard.string(forKey: identifiers.apiToken)
        {
            let request = requests.deleteUser(api_token: api_token)
            request.responseJSON { (response) in
                
                if let body:String = response.value as? String{
                    if(body == ApiBodyResponses.shared.userDeleted){
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        }else{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
