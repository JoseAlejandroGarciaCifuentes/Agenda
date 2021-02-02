
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
     
        let parameters =
            ["username":usernameTF.text!,
             "password":passwordTF.text!]
        
        let request = Requests.shared.login(parameters: parameters)
        
        request.responseJSON { response in
            
            debugPrint(response.value!)
        }
    }

}

