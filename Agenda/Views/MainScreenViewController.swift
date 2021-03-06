import UIKit

class MainScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var users:[User] = []
    let identifiers = Identifiers.shared
    
    /**
    Al mostrarse la pantalla el nav controller desaparece
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    /**
     Al iniciarse la pantalla se hace una peticion para recoger todos los users además recarga las celdas
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let request = Requests.shared.getUsers()
        
        request.response { (responseData) in
        
        guard let data = responseData.data else {return}
        
            do{
                self.users = try JSONDecoder().decode([User].self, from: data)
                self.tableView.reloadData()
            }catch{
                print("Error decoding == \(error)")
            }
        
        }
    }

    // Devuelve el número de elemtos del listado
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    /* Devuelve la celda de la posición correspondiente
     Paso el nombre, apellidos e imagen a la celda que sea pulsada
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.cellID) as! UserRow
        cell.nameLabel.text = users[indexPath.row].name
        cell.surnameLabel.text = users[indexPath.row].surname
        let request = Requests.shared.downloadImage(url: users[indexPath.row].profilePic)
        
        request.response{ response in

            switch response.result {
                 case .success(let responseData):
                     cell.profilePicIV.image = UIImage(data: responseData!, scale:1)

                 case .failure(let error):
                     print("error--->",error)
            }
        }
         
        return cell
    }
    
    // Este método se ejecuta cuando se pulsa una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = users[indexPath.row]
        performSegue(withIdentifier: identifiers.toDetail, sender: selectedItem)
    }
    
    // Enviar la información del elemento a la pantalla de detalle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.user = sender as? User
    }
}
