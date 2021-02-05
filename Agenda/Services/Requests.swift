import Foundation
import Alamofire

class Requests {
    
    static let shared = Requests()
    let apiBodyNames:ApiBodyNames
    private init() {
        apiBodyNames = ApiBodyNames.shared
    }
    
    //Devuelve todos los users de la bbdd
    func getUsers() -> DataRequest {

        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.all, method: .get, parameters: nil, encoding: URLEncoding.default)

    }
    
    //Recibe user y lo pasa por param, devuelve datos de la petición
    func registerUser(user:User) -> DataRequest {

        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
    }
    
    //Recibe params (email) , devuelve datos de la petición
    func restorePassword(parameters:[String:String]) {

        AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.restorePassword, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        
        }
    }
    //Recibe params (user y pass) , devuelve datos de la petición
    func login(parameters:[String:String])-> DataRequest{
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.login, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)

    }
    //Recibe api_token , devuelve datos de la petición
    func deleteUser(api_token:String) -> DataRequest {
        let headers : HTTPHeaders = [apiBodyNames.apiToken: api_token]
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.delete, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
        }
        
    //recibe url devuelve datos de la app
    func downloadImage(url:String) -> DataRequest{
        return AF.request(url, method: .get)
    }
    
    //recibe pass y api token, devuelve datos de la petición
    func updatePassword(password:String, api_token:String) -> DataRequest {
        
        let headers:HTTPHeaders = [apiBodyNames.apiToken:api_token]
        let parameters:[String:String] = [apiBodyNames.newPassword:password]
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.updatePassword, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers)
    
    }
    
    //recibe api token recibe datos de la aplicación
    func getProfileInfo(api_token:String) -> DataRequest {

        let headers:HTTPHeaders = [apiBodyNames.apiToken:api_token]
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.getProfileInfo, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
    }
}



    

