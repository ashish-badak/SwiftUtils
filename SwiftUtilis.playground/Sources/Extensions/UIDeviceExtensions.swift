import UIKit
import AudioToolbox

extension UIDevice {
    static var deviceModel: String {
        return "\(self.current.systemName), \(self.current.systemVersion), \(self.current.model)"
    }
    
    static var OSVersion: String {
        return self.current.systemVersion
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
