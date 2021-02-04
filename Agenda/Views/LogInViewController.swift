
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
        
        if(!usernameTF.text!.isEmpty && !passwordTF.text!.isEmpty){
            
            let parameters =
                ["username":usernameTF.text!,
                 "password":passwordTF.text!]
            
            let request = Requests.shared.login(parameters: parameters)
            
            request.responseJSON { response in
                
                if(response.value! as! String != "500"){
                    let body = response.value! as! String
                    let bodies = body.split(separator: " ")
                
                    if(response.response!.statusCode == 200 && bodies[0] == "OK"){
                        self.performSegue(withIdentifier: "cellID", sender: sender)
                        UserDefaults.standard.set(bodies[1], forKey: "api_token" )
                        print(UserDefaults.standard.string(forKey: "api_token")!)
                    }
                }
            }
            
        }else{
            
        }

    }
    
    
    @IBAction func goToSignUpBT(_ sender: UIButton) {
        
    }
    
}
/** GET USERS
 let request = Requests.shared.getUsers()
 
 request.response { (responseData) in
 guard let data = responseData.data else {return}
 
 do{
     let users = try JSONDecoder().decode([User].self, from: data)
     
     for user in users{
         print(user.email)
     }
     
     
 }catch{
     print("Error decoding == \(error)")
 }
 
 }
 */
     
        


