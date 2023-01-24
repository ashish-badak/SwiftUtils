import UIKit


// - MARK: UITableView Section Header Footer Registration and Dequeuing
extension UITableView {
    func register<View: UITableViewHeaderFooterView>(_ type: View.Type) {
        register(View.self, forHeaderFooterViewReuseIdentifier: View.reuseId)
    }
    
    func register<View: UITableViewHeaderFooterView>(_ type: View.Type) where View: NibLoadableView {
        register(View.nib, forHeaderFooterViewReuseIdentifier: View.reuseId)
    }
    
    func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(_ type: View.Type) -> View? {
        dequeueReusableHeaderFooterView(withIdentifier: View.reuseId) as? View
    }
}


// - MARK: UITableViewCell Registration and Dequeuing
extension UITableView {
    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        self.register(Cell.self, forCellReuseIdentifier: Cell.reuseId)
    }
    
    func register<Cell: UITableViewCell>(_ type: Cell.Type) where Cell: NibLoadableView {
        self.register(Cell.nib, forCellReuseIdentifier: Cell.reuseId)
    }
    
    func dequeue<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell
            else {
                fatalError("Failed to dequeue cell with reuseIdentifier: \(Cell.reuseId)")
        }
        
        return cell
    }
}
