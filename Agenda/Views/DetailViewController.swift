
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var profilePicIV: UIImageView!
    
    var user: User?
    
    /**
    Al mostrarse la pantalla el nav controller aparece
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    /**
     Al entrar a la pantalla por primera vez recoge el usuario enviado de la pantalla anterior
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = user?.username
        fullNameLabel.text = user!.name + " " + user!.surname
        emailLabel.text = user?.email
        let request = Requests.shared.downloadImage(url: user!.profilePic)
        
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
