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
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let api_token:String = UserDefaults.standard.string(forKey: "api_token"){
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
        
        
    }
    @IBAction func deleteBT(_ sender: UIButton) {
        if let api_token:String = UserDefaults.standard.string(forKey: "api_token")
        {
            print(api_token.description)
            
            /*let parameters : [String:String] = [
                "api_token": api_token as! String
            ]*/
            
            let request = Requests.shared.deleteUser(api_key: api_token)
            request.responseJSON { (response) in
                
                debugPrint(response)
                
                /*if(response.value! as! String == "Deleted"){
                    self.navigationController?.popToRootViewController(animated: true)
                }*/
            }
        }else{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
