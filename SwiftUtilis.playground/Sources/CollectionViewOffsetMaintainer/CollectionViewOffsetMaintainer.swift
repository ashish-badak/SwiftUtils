import Foundation
import UIKit

/**
 - `CollectionViewOffsetMaintainer` can be used to maintain horizontal scroll offset of nested collection view.
 - Conside you have one parent collection view which scrolls vertically.
 - Now that collection view consists of a section where it contains nested collectionview scrolling horizontally. And there are many of them
 - Like in e-commerce app; similar products on products-detail page, recommended items, etc.
 - On each vertical scroll, nested collectionview loses its position.
 - We can use `CollectionViewOffsetMaintainer` to maintina that scroll offset.
 */

// 1. Confirm your outer collection view's cell (which consists nested collection view) to this protocol
protocol CollectionViewOffsetMaintaining: AnyObject {
    var collectionView: UICollectionView { get }
    var collectionViewOffset: CGFloat { get set }
}

extension CollectionViewOffsetMaintaining {
    var collectionViewOffset: CGFloat {
        get { collectionView.contentOffset.x }
        set { collectionView.contentOffset.x = newValue }
    }
}

// 2. Declare instance of this inside your outer collection view or or inside your controller.
final class CollectionViewOffsetMaintainer {
    var collectionViewOffsets: [AnyHashable: CGFloat]
    var defaultOffset: CGFloat
    
    init(offsetDefaults: [AnyHashable: CGFloat], defaultOffset: CGFloat) {
        collectionViewOffsets = offsetDefaults
        self.defaultOffset = defaultOffset
    }
    
    convenience init(defaultOffset: CGFloat) {
        self.init(offsetDefaults: [:], defaultOffset: defaultOffset)
    }
    
    // 3. Call following two methods from parent collection view's `willDisplay` and `didEndDisplaying` methods.
    
    func willDisplay(_ view: UICollectionViewCell, at index: AnyHashable) {
        if let view = view as? CollectionViewOffsetMaintaining {
            view.collectionViewOffset = collectionViewOffsets[index] ?? -defaultOffset
        }
    }
    
    func didEndDisplaying(_ view: UICollectionViewCell, at index: AnyHashable) {
        if let view = view as? CollectionViewOffsetMaintaining {
            collectionViewOffsets[index] = view.collectionViewOffset
        }
    }
}
