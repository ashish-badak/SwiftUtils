import UIKit

// 1. Create an enum consisting a case per storyboard, conform that enum to `StoryboardProvider`
// OR
// 2. Conform this protocol to your `UIViewController` and set corresponding values

protocol StoryboardProvider {
    var storyboardName: String { get }
    var storyboardBundle: Bundle? { get }
    func getStoryboard() -> UIStoryboard
}

extension StoryboardProvider {
    var storyboardBundle: Bundle? { .main }
    
    func getStoryboard() -> UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
}
