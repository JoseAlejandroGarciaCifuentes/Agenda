import Foundation
extension String
{
    // MARK:- Properties

    var isValidEmail: Bool
    {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }

    // MARK:- Methods

    func validatedText(_ validationType: ValidatorType) throws
    {
        switch validationType
        {
            case .name:
                try validateUsername()
            case .email:
                try validateEmail()
        }
    }

    // MARK:- Private Methods

    private func validateUsername() throws
    {
        if isEmpty
        {
            throw ValidationError.invalidUserName
        }
    }

    private func validateEmail() throws
    {
        if !isValidEmail
        {
            throw ValidationError.invalidEmail
        }

        // add more validations if you want like empty email
    }
}
