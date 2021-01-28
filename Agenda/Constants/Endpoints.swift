import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    let baseUrl = "http://192.168.1.40/Laravel/api-cryptonite/public/api/users"
    
    //User´s Petitions
    let register:String = "/register"
    let login:String = "/login"
    let restorePassword:String = "/restore/password"
    let updatePassword:String = "/updatePassword"
    let getProfileInfo:String = "/getProfileInfo"
    let updateProfile:String = "/updateProfile"
    let all:String = "/all"
}

    
    


