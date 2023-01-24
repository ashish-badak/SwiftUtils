import UIKit

struct Haptics {
    /// This function provides notification haptics as `error`, `warning`, `success`
    /// - Parameter notification: `UINotificationFeedbackGenerator.FeedbackType` case value
    static func notify(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(notification)
    }
    
    /// This function provides haptic feedback of impact style -> `light`, `medium`, `heavy`
    /// - Parameter impact: `UIImpactFeedbackGenerator.FeedbackStyle` case value
    static func markImpact(intensity: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: intensity)
        generator.prepare()
        generator.impactOccurred()
    }
    
    /// This function provides haptic feedback of item selection just like UIPicker.
    static func selectionEffect() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
}
