
import Foundation
import UIKit

/**
 Comprueba que el email sea correcto en función de ciertas validaciones del string del textfield, devielve true o false
 */
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

/**
Comprueba que el password textfield no este vacio, devielve true o false
 En caso de false hace animación en textfield
*/
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

/**
Comprueba que el username textfield no este vacio, devielve true o false
 En caso de false hace animación en textfield
*/
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

/**
Comprueba que el name  textfield no este vacio, devielve true o false
 En caso de false hace animación en textfield
*/
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

/**
Comprueba que el surname textfield no este vacio, devielve true o false
 En caso de false hace animación en textfield
*/
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
