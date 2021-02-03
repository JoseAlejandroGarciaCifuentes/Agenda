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
        
    }
    
    @IBAction func deleteBT(_ sender: UIButton) {
        if let api_token = UserDefaults.standard.value(forKey: "api_token")
        {
            print(api_token)
            
            let parameters: [String:String] = [
                "api_token": api_token as! String
            ]
            let request = Requests.shared.deleteUser(parameters: parameters)
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
