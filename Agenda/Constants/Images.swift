

import Foundation

class Images{
    let imageOne:String
    let imageTwo :String
    let imageThree:String
    let imageFour:String
    let imageFive:String
    let imageSix:String
    
    let pictures:[String]
    
    private init() {
        
        self.imageOne = "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png"
        self.imageTwo = "https://happytravel.viajes/wp-content/uploads/2020/04/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
        self.imageThree = "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        self.imageFour = "https://images.pexels.com/photos/1759530/pexels-photo-1759530.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        self.imageFive = "https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg"
        self.imageSix = "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"
        
        self.pictures = [imageOne,imageTwo,imageThree ,imageFour ,imageFive , imageSix]
    }
    
    static let shared = Images()
    
    
    
    
    
    
}
