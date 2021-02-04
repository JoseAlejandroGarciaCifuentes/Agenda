import Foundation

enum ValidatorType
{
    case email
    case name
    case password
    case username
    case surname
    // add more cases ...
}

enum ValidationError: Error, LocalizedError
{
    case invalidUserName
    case invalidEmail
    case invalidPassword
    case invalidName
    case invalidSurname
    // add more cases ...

    var localizedDescription: String
    {
        switch self
        {
            case .invalidEmail:
                return "Please enter a valid email"
            case .invalidUserName:
                return "Please enter a valid username"
            case .invalidPassword:
                return "Please enter a valid password"
            case .invalidName:
                return "Please enter a valid name"
            case .invalidSurname:
                return "Please enter a valid surname"
            
        }
    }
}
