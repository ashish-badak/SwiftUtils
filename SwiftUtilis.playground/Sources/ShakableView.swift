import Foundation

import UIKit

enum ShakeAxis {
    case horizontal, veritcal
    var keypath: String {
        switch self {
        case .horizontal: return "transform.translation.x"
        case .veritcal: return "transform.translation.y"
        }
    }
}

protocol ShakableView {
    var movementEffect: CAMediaTimingFunctionName { get }
    
    func shake(
        on axis: ShakeAxis,
        repeatCount: Float,
        for duration: CFTimeInterval,
        withTranslation translation: Float
    )
}

extension ShakableView where Self: UIView {
    var movementEffect: CAMediaTimingFunctionName { return .linear }
    
    func shake(
        on axis: ShakeAxis = .horizontal,
        repeatCount: Float = 2,
        for duration: CFTimeInterval = 0.1,
        withTranslation translation: Float = 5
    ) {
        let animation = CAKeyframeAnimation(keyPath: axis.keypath)
        animation.timingFunction = CAMediaTimingFunction(name: movementEffect)
        animation.repeatCount = repeatCount
        animation.duration = duration / CFTimeInterval(repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
