import Foundation
import Alamofire

class Requests {
    
    static let shared = Requests()
    
    private init() {}
    
    func getUsers() -> DataRequest {
        
        /*AF.request(Endpoints.shared.baseUrl+Endpoints.shared.all, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil).response { (responseData) in
            guard let data = responseData.data else {return}
            
            do{
                let users = try JSONDecoder().decode([User].self, from: data)
                print("users == \(users)")
                
            }catch{
                print("Error decoding == \(error)")
            }
        }*/
        
        /*let request = AF.request(Endpoints.shared.baseUrl+Endpoints.shared.all)
        // 2
        request.responseJSON { (data) in
          print(data)
        }*/
        
        return AF.request(Endpoints.shared.baseUrl+Endpoints.shared.all, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil)
        
    }
    
    func postUsers(user:User) {

        AF.request(Endpoints.shared.baseUrl+Endpoints.shared.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        
        }
    }
    
    func restorePassword(parameters:[String:String]) {

        AF.request(Endpoints.shared.baseUrl+Endpoints.shared.restorePassword, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        
        }
    }
}
