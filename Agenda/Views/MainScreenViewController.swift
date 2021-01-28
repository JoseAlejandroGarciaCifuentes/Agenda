//
//  MainScreenViewController.swift
//  Agenda
//
//  Created by alumnos on 28/01/2021.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsersFromRequest()
       
        
    }
    
    func getUsersFromRequest(){
        
        let request = Requests.shared.getUsers()
        
        request.response { (responseData) in
        guard let data = responseData.data else {return}

            do{
                let users = try JSONDecoder().decode([User].self, from: data)
                
                //rellenar users
                

            }catch{
                print("Error decoding == \(error)")
            }

        }
    }
    
    
}
