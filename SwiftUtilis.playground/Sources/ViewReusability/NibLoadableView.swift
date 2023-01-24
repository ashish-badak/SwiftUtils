import UIKit

protocol NibLoadableView { }

extension NibLoadableView {
    static var nibName: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: nibName, bundle: nil) }
}
