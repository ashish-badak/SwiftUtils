import UIKit

enum ShimmerDirection {
    case topToBottom
    case topLeftToBottomRight
    case leftToRight
    case bottomLeftToTopRight
    case bottomToTop
    case bottomRightToTopLeft
    case rightToLeft
    case topRightToBottomLeft
}

fileprivate extension ShimmerDirection {
    var startPoint: CGPoint {
        switch self {
        case .topToBottom: return CGPoint(x: 0.5, y: 0)
        case .topLeftToBottomRight: return CGPoint(x: 0, y: 0)
        case .leftToRight: return CGPoint(x: 0, y: 0.5)
        case .bottomLeftToTopRight: return CGPoint(x: 0, y: 1)
        case .bottomToTop: return CGPoint(x: 0.5, y: 1)
        case .bottomRightToTopLeft: return CGPoint(x: 1, y: 1)
        case .rightToLeft: return CGPoint(x: 1, y: 0.5)
        case .topRightToBottomLeft: return CGPoint(x: 1, y: 0)
        }
    }
    
    var endPoint: CGPoint {
        switch self {
        case .topToBottom: return CGPoint(x: 0.5, y: 1)
        case .topLeftToBottomRight: return CGPoint(x: 1, y: 1)
        case .leftToRight: return CGPoint(x: 1, y: 0.5)
        case .bottomLeftToTopRight: return CGPoint(x: 1, y: 0)
        case .bottomToTop: return CGPoint(x: 0.5, y: 0)
        case .bottomRightToTopLeft: return CGPoint(x: 0, y: 0)
        case .rightToLeft: return CGPoint(x: 0, y: 0.5)
        case .topRightToBottomLeft: return CGPoint(x: 0, y: 1)
        }
    }
}

// Conform your custom views to this protocol to add shimmer functionality [Recommended]
// To have it available on all UIViews just add conformance to `UIView` [Not recommended]
protocol ShimmerableView {
    func startShimmering(
        duration: TimeInterval,
        direction: ShimmerDirection,
        repeatCount: Float
    )
    func stopShimmering()
}

extension ShimmerableView where Self: UIView {
    func startShimmering(
        duration: TimeInterval = 0.75,
        direction: ShimmerDirection = .leftToRight,
        repeatCount: Float = .infinity
    ) {
        let whiteColor = UIColor(displayP3Red: 1,green: 1, blue: 1, alpha: 0.1).cgColor
        let blackColor = UIColor.black.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [blackColor, whiteColor, blackColor]
        gradientLayer.frame = CGRect(
            x: -bounds.size.width,
            y: -bounds.size.height,
            width: 3 * bounds.size.width,
            height: 3 * bounds.size.height
        )

        gradientLayer.startPoint = direction.startPoint
        gradientLayer.endPoint = direction.endPoint

        gradientLayer.locations =  [0.35, 0.50, 0.65]
        layer.mask = gradientLayer
        
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = duration
        animation.repeatCount = repeatCount
        
        CATransaction.setCompletionBlock { [weak self] in
            self?.layer.mask = nil
        }
        
        gradientLayer.add(animation, forKey: "shimmerAnimation")
        CATransaction.commit()
    }
    
    func stopShimmering() {
        layer.mask = nil
    }
}
