//
//  LoginController.swift
//  Agenda
//
//  Created by alumnos on 27/01/2021.
//  Copyright © 2021 Alejandro García. All rights reserved.
//

import Foundation
import UIKit

public func checkEmail(textFieldEmail:UITextField, errorLabel:UILabel) -> Bool
{
    do
    {
        try textFieldEmail.validatedText(.email)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        errorLabel.isHidden = false
        errorLabel.text = validationError.localizedDescription
        return false
    }

    return true
}
