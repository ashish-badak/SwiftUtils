import UIKit

// - MARK: UICollectionView Header Footer Registration and Dequeuing
extension UICollectionView {
    enum ElementKind {
        case header, footer
        
        var value: String {
            switch self {
            case .header: return UICollectionView.elementKindSectionHeader
            case .footer: return UICollectionView.elementKindSectionFooter
            }
        }
    }
    
    func register<T: UICollectionReusableView>(_ type: T.Type, for kind: UICollectionView.ElementKind) where T: NibLoadableView {
        register(T.nib, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: T.reuseId)
    }
    
    func register<T: UICollectionReusableView>(_ type: T.Type, for kind: UICollectionView.ElementKind) {
        register(T.self, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: T.reuseId)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        _ type: T.Type,
        for indexPath: IndexPath,
        of kind: UICollectionView.ElementKind
    ) -> T? {
        dequeueReusableSupplementaryView(
            ofKind: kind.value,
            withReuseIdentifier: T.reuseId,
            for: indexPath
        ) as? T
    }
}

// - MARK: UICollectionViewCell Registration and Dequeuing
extension UICollectionView {
    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) where Cell: NibLoadableView {
        register(Cell.nib, forCellWithReuseIdentifier: Cell.reuseId)
    }
    
    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(Cell.self, forCellWithReuseIdentifier: Cell.reuseId)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(Cell.reuseId)")
        }
        return cell
    }
}

