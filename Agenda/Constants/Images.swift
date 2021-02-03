

import Foundation

class Images{
    
    private init() {}
    
    static let shared = Images()
    
    let imageOne = "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png"
    let imageTwo = "https://happytravel.viajes/wp-content/uploads/2020/04/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
    let imageThree = "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
    let imageFour = "https://images.pexels.com/photos/1759530/pexels-photo-1759530.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
    let imageFive = "https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg"
    let imageSix = "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"
    
    
    let pictures = [Images.shared.imageOne,Images.shared.imageTwo,Images.shared.imageThree ,Images.shared.imageFour ,Images.shared.imageFive , Images.shared.imageSix]
}
