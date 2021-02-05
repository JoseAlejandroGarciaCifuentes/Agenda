import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirmedPass: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    let identifiers = Identifiers.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Esconde teclado al hacer tap en la pantalla
        self.hideKeyboardWhenTappedAround()
        
    }
    
    /**
     Al mostrarse la pantalla el nav controller aparece
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    /**
    Al terminar de escribir en el textfield, el error label desaparece
    */
    @IBAction func OnFinishTypingEmail(_ sender: UITextField) {
        emailErrorLabel.isHidden = true
    }
    /**
    Al pulsar el boton de sign up se comprueba que el email y la pass no esten vacias y que el email no sea erróneo
     Si todo bien se hace el segue hacia la siguiente pantalla
     */
    @IBAction func SignUpButton(_ sender: UIButton) {
        
        if checkEmail(textFieldEmail: textFieldEmail, errorLabel: emailErrorLabel) && checkPassword(textFieldPass: textFieldPassword) && checkPassword(textFieldPass: textFieldConfirmedPass){
                self.performSegue(withIdentifier: identifiers.signUp , sender: sender)
        }
    }
    
    /**
     Al pulsar el boton login te lleva a pantalla root o login screen
     */
    @IBAction func goToLogInBT(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /**
     Comprueba identificador a la hora de realizar segue y pasa email y pass a la siguiente pantalla
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == identifiers.signUp){
            let controller = segue.destination as! SignUpDetailsViewController
            controller.email = textFieldEmail.text!
            controller.password = textFieldPassword.text!
            
        }
        
    }
    
}

