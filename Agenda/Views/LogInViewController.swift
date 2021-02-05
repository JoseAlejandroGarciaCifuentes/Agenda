
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    let identifiers = Identifiers.shared
    
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
    
    /**
     Boton de login comprueba username y pass que no esten vacias
     En caso de no estarlo hace la petición pasando estos mismo params y hace segue hacia pantalla main
     Además se guarda el token en local
     */
    @IBAction func LogInButton(_ sender: UIButton) {
        
        if checkUsername(textFieldUsername:usernameTF) && checkPassword(textFieldPass: passwordTF){
            let apiBodyNames = ApiBodyNames.shared
            let parameters =
                [apiBodyNames.username:usernameTF.text!,
                 apiBodyNames.password:passwordTF.text!]
            
            let request = Requests.shared.login(parameters: parameters)
            
            request.responseJSON { response in
                
                if(response.value! as! String != "No User"){
                    let httpBody = response.value! as! String
                    let bodySplitted = httpBody.split(separator: " ")
                
                    if(response.response!.statusCode == 200 && bodySplitted[0] == "OK"){
                        self.performSegue(withIdentifier: self.identifiers.cellID, sender: sender)
                        UserDefaults.standard.set(bodySplitted[1], forKey: self.identifiers.apiToken)
                    }
                }
            }
            
        }
    }
    
}

     
        


