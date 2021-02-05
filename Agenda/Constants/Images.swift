

import Foundation

class Images{
    
    let urls = Urls.shared
    let pictures:[String]
    
    private init() {
        
        self.pictures = [urls.imageOne,urls.imageTwo,urls.imageThree ,urls.imageFour ,urls.imageFive , urls.imageSix]
    }
    
    static let shared = Images()
    
}
