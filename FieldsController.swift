
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


public func checkPassword(textFieldPass:UITextField) -> Bool
{
    do
    {
        try textFieldPass.validatedText(.password)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        //errorLabel.isHidden = false
        //errorLabel.text = validationError.localizedDescription
        return false
    }

    return true
}


public func checkUsername(textFieldUsername:UITextField) -> Bool
{
    do
    {
        try textFieldUsername.validatedText(.username)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        //errorLabel.isHidden = false
        //errorLabel.text = validationError.localizedDescription
        return false
    }

    return true
}

public func checkName(textFieldName:UITextField) -> Bool
{
    do
    {
        try textFieldName.validatedText(.name)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        //errorLabel.isHidden = false
        //errorLabel.text = validationError.localizedDescription
        return false
    }

    return true
}

public func checkSurname(textFieldSurname:UITextField) -> Bool
{
    do
    {
        try textFieldSurname.validatedText(.surname)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        //errorLabel.isHidden = false
        //errorLabel.text = validationError.localizedDescription
        return false
    }

    return true
}
