

import Foundation

class Random {
    
    static let shared = Random()
    
    private init(){}
    
    func getRandom(max:Int) -> Int{
        return Int.random(in: 0..<max)
    }
}
