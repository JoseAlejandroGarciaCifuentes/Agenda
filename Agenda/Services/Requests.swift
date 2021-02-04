import Foundation
import Alamofire

class Requests {
    
    static let shared = Requests()
    let apiBodyNames:ApiBodyNames
    private init() {
        apiBodyNames = ApiBodyNames.shared
    }
    
    func getUsers() -> DataRequest {

        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.all, method: .get, parameters: nil, encoding: URLEncoding.default)

    }
    
    func registerUser(user:User) -> DataRequest {

        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
    }
    
    func restorePassword(parameters:[String:String]) {

        AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.restorePassword, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        
        }
    }

    func login(parameters:[String:String])-> DataRequest{
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.login, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)

    }
    
    func deleteUser(api_token:String) -> DataRequest {
        let headers : HTTPHeaders = [apiBodyNames.apiToken: api_token]
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.delete, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
        }
        
    
    func getImage(url:String) -> DataRequest{
        return AF.request(url, method: .get)
    }
    
    func updatePassword(password:String, api_token:String) -> DataRequest {
        
        let headers:HTTPHeaders = [apiBodyNames.apiToken:api_token]
        let parameters:[String:String] = [apiBodyNames.newPassword:password]
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.updatePassword, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers)
    
    }
    
    func getProfileInfo(api_token:String) -> DataRequest {

        let headers:HTTPHeaders = [apiBodyNames.apiToken:api_token]
        
        return AF.request(Endpoints.shared.localMac + Endpoints.shared.baseUrl + Endpoints.shared.getProfileInfo, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)

    }
}



    

