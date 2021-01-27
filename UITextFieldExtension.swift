import UIKit

extension UITextField
{
    func validatedText(_ validationType: ValidatorType) throws
    {
        do
        {
            try text?.validatedText(validationType)
        }
        catch let validationError
        {
            shake()
            throw validationError
        }
    }

    // MARK:- Private Methods

    private func shake()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 5
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x + 6, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x - 6, y: center.y))
        layer.add(animation, forKey: "position")
    }
    
    func setBottomBorderOnlyWith(color: CGColor) {
        //self.borderStyle = .none
        //self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
