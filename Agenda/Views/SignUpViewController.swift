import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirmedPass: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    @IBAction func OnFinishTypingEmail(_ sender: UITextField) {
        emailErrorLabel.isHidden = true
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        
        if checkEmail(textFieldEmail: textFieldEmail, errorLabel: emailErrorLabel)
        {
            if(!textFieldPassword.text!.isEmpty){
                if(textFieldPassword.text! == textFieldConfirmedPass.text!){
                    self.performSegue(withIdentifier: "signup", sender: sender)
                }
            }
        }
    }
    
    
    @IBAction func goToLogInBT(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "signup"){
            let controller = segue.destination as! SignUpDetailsViewController
            controller.email = textFieldEmail.text!
            controller.password = textFieldPassword.text!
            
        }
        
    }
    
}

