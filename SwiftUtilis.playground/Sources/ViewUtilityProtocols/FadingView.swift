import UIKit

// Conform your custom views to this protocol to add fade-in and fade-out animation functionality [Recommended]
// To have it available on all UIViews just add conformance to `UIView` [Not recommended]
protocol FadingView {
    func fadeIn(
        duration: TimeInterval,
        delay: TimeInterval,
        completion: ((Bool) -> Void)?
    )
    func fadeOut(
        duration: TimeInterval,
        delay: TimeInterval,
        completion: ((Bool) -> Void)?
    )
}

extension FadingView where Self: UIView {
    func fadeIn(
        duration: TimeInterval = 0.5,
        delay: TimeInterval = 0.0,
        completion: ((Bool) -> Void)? = nil
    ) {
        alpha = 0.0

        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .curveEaseIn,
            animations: { [weak self] in
                self?.isHidden = false
                self?.alpha = 1.0
            },
            completion: completion
        )
    }
    
    func fadeOut(
        duration: TimeInterval = 0.5,
        delay: TimeInterval = 0.0,
        completion: ((Bool) -> Void)? = nil
    ) {
        alpha = 1.0

        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .curveEaseIn,
            animations: { [weak self] in
                self?.alpha = 0.0
            }
        ) { [weak self] (completed) in
            self?.isHidden = true
            completion?(true)
        }
    }
}
