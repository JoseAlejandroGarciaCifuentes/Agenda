import Foundation

enum ValidatorType
{
    case email
    case name
    // add more cases ...
}

enum ValidationError: Error, LocalizedError
{
    case invalidUserName
    case invalidEmail
    // add more cases ...

    var localizedDescription: String
    {
        switch self
        {
            case .invalidEmail:
                return "Please enter a valid email"
            case .invalidUserName:
                return "Please enter a valid username"
        }
    }
}
