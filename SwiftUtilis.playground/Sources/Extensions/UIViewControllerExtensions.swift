import UIKit

extension UIViewController {
    func add(childViewController: UIViewController, parentView: UIView) {
        addChild(childViewController)
        parentView.addSubview(childViewController.view)
        childViewController.view.frame = parentView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
    var isModallyPresented: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        }
        
        if presentingViewController != nil {
            return true
        }
        
        if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        }
        
        if tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false
    }
}
