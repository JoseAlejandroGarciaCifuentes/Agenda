
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var ErrorUserLabel: UILabel!
    @IBOutlet weak var ErrorPassLabel: UILabel!
    let identifiers = Identifiers.shared
    let apiBodyResponses = ApiBodyResponses.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Esconde teclado al hacer tap en la pantalla
        self.hideKeyboardWhenTappedAround()
        
    }
    
    /**
    Al mostrarse la pantalla el nav controller desaparece
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    
    @IBAction func onFinishTypingUsername(_ sender: UITextField) {
        ErrorUserLabel.isHidden = true
    }
    
    
    @IBAction func onFinishTypingPass(_ sender: UITextField) {
        ErrorPassLabel.isHidden = true
    }
    
    /**
     Boton de login comprueba username y pass que no esten vacias
     En caso de no estarlo hace la petición pasando estos mismo params y hace segue hacia pantalla main
     Además se guarda el token en local
     */
    @IBAction func LogInButton(_ sender: UIButton) {
        
        if checkUsername(textFieldUsername:usernameTF, errorLabel: ErrorUserLabel) && checkPassword(textFieldPass: passwordTF, errorLabel: ErrorPassLabel){
            let apiBodyNames = ApiBodyNames.shared
            let parameters =
                [apiBodyNames.username:usernameTF.text!,
                 apiBodyNames.password:passwordTF.text!]
            
            let request = Requests.shared.login(parameters: parameters)
            
            request.responseJSON { response in
                
                if let body:String = response.value as? String {
                    if(body != self.apiBodyResponses.noUser){
                        let httpBody = response.value! as! String
                        let bodySplitted = httpBody.split(separator: " ")
                    
                        if(response.response!.statusCode == StatusCodes.shared.OK && bodySplitted[0] == self.apiBodyResponses.loginCorrect){
                            self.performSegue(withIdentifier: self.identifiers.cellID, sender: sender)
                            UserDefaults.standard.set(bodySplitted[1], forKey: self.identifiers.apiToken)
                        }
                    }else{
                        self.ErrorUserLabel.isHidden = false
                        self.ErrorUserLabel.text = UserMessages.shared.unknownUser
                    }
                }
            }
            
        }
    }
    
}

     
        


