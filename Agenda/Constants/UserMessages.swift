//
//  userMessages.swift
//  Agenda
//
//  Created by alumnos on 05/02/2021.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import Foundation


class UserMessages {
    
    static let shared = UserMessages()
    private init(){}
 
    let noMatchingPasswords = "Passwords do not match"
    let unknownUser = "This user does not exist"
    
}
