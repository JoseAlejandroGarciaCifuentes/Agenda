import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    //DOMAIN
    let myComputer = "http://192.168.1.40"
    let localMac = "http://localhost:8888"
    let localWin = "http://localhost"
    
    //API DATA LOCATION
    let baseUrl = "/Laravel/api-cryptonite/public/api/users"
    let cevUrl = "/Alejandro/api-cryptonite/public/api/users"

    
    //User´s Petitions
    let register:String = "/register"
    let login:String = "/login"
    let restorePassword:String = "/restore/password"
    let updatePassword:String = "/updatePassword"
    let getProfileInfo:String = "/getProfileInfo"
    let updateProfile:String = "/updateProfile"
    let all:String = "/all"
    let delete:String = "/delete"
}

    
    


