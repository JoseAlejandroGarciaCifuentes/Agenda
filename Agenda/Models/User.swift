
import Foundation;
import UIKit;

class User : Encodable, Decodable{
    
    private let _username:String
    private let _email:String
    private var _name:String
    private var _surname:String
    private var _profilePic:String?
    private var _password:String?
    
    
    enum CodingKeys:String, CodingKey {
        case _name = "name"
        case _username = "username"
        case _profilePic = "profile_pic"
        case _email = "email"
        case _surname = "surname"
        case _password = "password"
    }
    
    init(username:String, email:String, name:String, surname:String, profilePic:String, password:String){
        
        self._username = username
        self._email = email
        self._name = name
        self._surname = surname
        self._profilePic = profilePic
        self._password = password
    }
    
    public var name: String {
        get {
            return self._name;
        }
        set {
            self._name = newValue
        }
    }
    public var password: String {
        get {
            return self._password ?? "";
        }
        set {
            self._password = newValue
        }
    }
    
    public var username: String {
        get {
            return self._username;
        }
    }
    public var email: String {
        get {
            return self._email;
        }
    }
    public var surname: String {
        get {
            return self._surname;
        }
        set {
            self._surname = newValue
        }
    }
    
    public var profilePic: String {
        get {
            return self._profilePic!;
        }
        set {
            self._profilePic = newValue
        }
    }
}

