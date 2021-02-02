import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirmedPass: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func OnFinishTypingEmail(_ sender: UITextField) {
        emailErrorLabel.isHidden = true
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        
        if checkEmail(textFieldEmail: textFieldEmail, errorLabel: emailErrorLabel)
        {
            let email = textFieldEmail.text!
            let password = textFieldPassword.text!
            
            let user = User(username: "mahtodonte", email: email, name: "arroba2", surname: "gmail", profilePic: "", password: password)
            
            Requests.shared.postUsers(user: user)
            
        }
    }
    
}

