import Foundation
import Alamofire

class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func getUsers() {
        
        AF.request(Endpoints.baseUrl+Endpoints.User.all, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil).response { (responseData) in
            guard let data = responseData.data else {return}
            
            do{
                let users = try JSONDecoder().decode([User].self, from: data)
                print("users == \(users)")
                
                for user in users{
                    print(user.email)
                }
                
            }catch{
                print("Error decoding == \(error)")
            }
        }
        
    }
    
    func postUsers() {
        
        let user = User(username: "mastodonte", email: "arrobagmail", name: "arroba", surname: "gmail", profilePic: "", password: "12314we")

        AF.request(Endpoints.baseUrl+Endpoints.User.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        
        }
    }
}
