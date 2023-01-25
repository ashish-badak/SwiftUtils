import UIKit

extension UIView {
    func addBorder(
        color: UIColor = .black,
        size: CGFloat = 1,
        cornerRadius: CGFloat = 0
    ) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = size
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        layoutIfNeeded()
        layer.mask = getRoundedMask(corners, radius: radius)
        layer.masksToBounds = true
    }
    
    @discardableResult private func getRoundedMask(_ corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        return mask
    }
}
