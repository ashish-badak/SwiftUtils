import UIKit

// Conform your `UIViewController` to this class if it needs to be instantiated from storyboard.
protocol StoryboardInstantiable {
    static var storyboardProvider: StoryboardProvider { get }
    static func instantiate() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardIdentifier: String { String(describing: self) }
    
    // Call this function using the `UIViewController` which you want to intantiate.
    // For e.g. `LoginViewController.instantiate()`
    static func instantiate() -> Self {
        let storyboard = storyboardProvider.getStoryboard()
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Failed to load \(storyboardIdentifier) from \(storyboardProvider.storyboardName) storyboard.")
        }
        return viewController
    }
}
