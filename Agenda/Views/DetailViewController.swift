
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(user!.email)
        
        usernameLabel.text = user?.username
        fullNameLabel.text = user!.name + " " + user!.surname
    }
    

}
