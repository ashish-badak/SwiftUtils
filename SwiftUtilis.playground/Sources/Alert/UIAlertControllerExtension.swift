import UIKit

extension UIAlertController {
    func show(in controller: UIViewController) {
        controller.present(self, animated: true)
    }
    
    // MARK: Alert
    static func alert(title: String, message: String? = nil) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
    
    func action(_ action: UIAlertAction) -> UIAlertController {
        self.addAction(action)
        return self
    }
    
    static func inform(
        title: String,
        message: String? = nil,
        in controller: UIViewController
    ) {
        alert(title: title, message: message)
            .action(.default("OK"))
            .show(in: controller)
    }
    
    static func confirm(
        title: String,
        message: String? = nil,
        in controller: UIViewController,
        onConfirm confirmationHandler: @escaping (UIAlertAction) -> Void,
        onCancel cancellationHandler: @escaping (UIAlertAction) -> Void
    ) {
        alert(title: title, message: message)
            .action(.cancel(handler: cancellationHandler))
            .action(.default("Ok", handler: confirmationHandler))
            .show(in: controller)
    }
    
    // MARK: Action Sheet
    static func actionSheet(title: String, message: String? = nil) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
    
    static func choose(
        title: String,
        message: String? = nil,
        in controller: UIViewController,
        options: [String],
        isSelectionMandatory: Bool = false,
        onSelect: @escaping (UIAlertAction) -> Void
    ) {
        let sheet = actionSheet(title: title, message: message)
        
        if !isSelectionMandatory {
            sheet.addAction(.cancel())
        }
        
        for option in options {
            sheet.addAction(.default(option, handler: onSelect))
        }
        
        sheet.show(in: controller)
    }
}
