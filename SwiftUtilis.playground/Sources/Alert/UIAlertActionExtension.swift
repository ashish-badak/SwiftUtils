import UIKit

extension UIAlertAction {
    static func `default`(
        _ title: String,
        handler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertAction {
        UIAlertAction(title: title, style: .default, handler: handler)
    }
    
    static func destructive(
        _ title: String,
        handler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertAction {
        UIAlertAction(title: title, style: .destructive, handler: handler)
    }
    
    static func cancel(
        _ title: String = "Cancel",
        handler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertAction {
        UIAlertAction(title: title, style: .cancel, handler: handler)
    }
}
