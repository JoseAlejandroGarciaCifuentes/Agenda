
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
        
        if(!usernameTF.text!.isEmpty && !passwordTF.text!.isEmpty){
            
            let parameters =
                ["username":usernameTF.text!,
                 "password":passwordTF.text!]
            
            let request = Requests.shared.login(parameters: parameters)
            
            request.responseJSON { response in
                print(response.value! as! String)
                if(response.response!.statusCode == 200){
                    //self.navigationController?.setNavigationBarHidden(true, animated: true)
                    self.performSegue(withIdentifier: "cellID", sender: sender)
                    UserDefaults.standard.set(response.value! as! String, forKey: "api_token" )
                }
            }
            
        }
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
     
        


