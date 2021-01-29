//
//  LogInController.swift
//  Agenda
//
//  Created by Alejandro García on 25/1/21.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
     
        let parameters = [
            "username":username.text!,
            "password":password.text!
        ]
         let request = Requests.shared.login(parameters: parameters)
        //request.responseJSON { (response) in
            //print(response.value!)
        }
    }




/** GET USERS
 let request = Requests.shared.getUsers()
 
 request.response { (responseData) in
 guard let data = responseData.data else {return}
 
 do{
     let users = try JSONDecoder().decode([User].self, from: data)
     
     for user in users{
         print(user.email)
     }
     
     
 }catch{
     print("Error decoding == \(error)")
 }
 
 }
 */
