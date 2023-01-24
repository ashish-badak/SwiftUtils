import UIKit

protocol NibFileOwnerLoadbleView: NibLoadableView {
    func loadFromNib()
}

extension NibFileOwnerLoadbleView where Self: UIView {
    private func instantiateFromNib() -> UIView? {
        let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
    
    func loadFromNib() {
        guard let contentView = instantiateFromNib() else {
            fatalError("Failed to instantiate \(Self.nibName).xib")
        }
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
    }
}

