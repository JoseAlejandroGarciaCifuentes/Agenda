
import UIKit

class RestorePasswordViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func ConfirmRestoring(_ sender: UIButton) {
        let parameters = [
            "email":textFieldEmail.text!]
        print(parameters)
        Requests.shared.restorePassword(parameters: parameters)
    }
}
