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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
     
        let request = Requests.shared.getUsers()
        /*request.responseJSON { (data) in
          print(data)
        }*/
        request.response { (responseData) in
        guard let data = responseData.data else {return}
        
        do{
            let users = try JSONDecoder().decode(User.self, from: data)
            print("users == \(users)")
            
        }catch{
            print("Error decoding == \(error)")
        }
        
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
