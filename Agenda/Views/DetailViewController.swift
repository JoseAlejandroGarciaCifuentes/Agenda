
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var profilePicIV: UIImageView!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = user?.username
        fullNameLabel.text = user!.name + " " + user!.surname
        emailLabel.text = user?.email
        let request = Requests.shared.getImage(url: user!.profilePic)
        
        request.response{ response in

            switch response.result {
                 case .success(let responseData):
                     self.profilePicIV.image = UIImage(data: responseData!, scale:1)

                 case .failure(let error):
                     print("error--->",error)
            }
        }

    }
}
