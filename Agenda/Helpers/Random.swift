

import Foundation

class Random {
    
    static let shared = Random()
    
    private init(){}
    
    //devuelve un num rand entre 0 y el max pasado por param
    func getRandom(max:Int) -> Int{
        return Int.random(in: 0..<max)
    }
}
