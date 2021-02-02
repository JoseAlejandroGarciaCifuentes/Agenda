import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let request = Requests.shared.getUsers()
        
        request.response { (responseData) in
        
        guard let data = responseData.data else {return}
        
            do{
                self.users = try JSONDecoder().decode([User].self, from: data)
                //debugPrint(responseData)
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
    
    // Devuelve la celda de la posición correspondiente
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! UserRow
        cell.nameLabel.text = users[indexPath.row].name
        cell.surnameLabel.text = users[indexPath.row].surname
        //cell.profilePicIV.image = users[indexPath.row].profilePic
        return cell
    }
    
    // Este método se ejecuta cuando se pulsa una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = users[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: selectedItem)
    }
    
    // Enviar la información del elemento a la pantalla de detalle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.user = sender as? User
    }
}
