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
    
    var user: User?
    
    let identifiers = Identifiers.shared
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let api_token:String = UserDefaults.standard.string(forKey: identifiers.apiToken){
            let request = Requests.shared.getProfileInfo(api_token: api_token)
            
            request.response { (responseData) in
            
            guard let data = responseData.data else {return}
            
                do{
                    
                    self.user = try JSONDecoder().decode(User.self, from: data)
                    self.nameLabel.text = self.user!.name
                    self.surnameLabel.text = self.user!.surname
                    self.emailLabel.text = self.user!.email
                    self.usernameLabel.text = self.user!.username
                    
                }catch{
                    print("Error decoding == \(error)")
                }
            
            }
        }
        
    }
    
    @IBAction func updatePassBT(_ sender: UIButton) {
        
        if checkPassword(textFieldPass: passwordField){
            
            if let api_token:String = UserDefaults.standard.string(forKey: identifiers.apiToken)
            {
                let request = Requests.shared.updatePassword(password: passwordField.text!, api_token: api_token)
                
                request.responseJSON { (response) in
                    debugPrint(response)
                }
                
            }
            
        }
    }
    
    
    @IBAction func deleteBT(_ sender: UIButton) {
        if let api_token:String = UserDefaults.standard.string(forKey: identifiers.apiToken)
        {
            let request = Requests.shared.deleteUser(api_token: api_token)
            request.responseJSON { (response) in
                
                if(response.value! as! String == "Deleted"){
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }else{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
