import UIKit

extension UITableView {
    
    func register(cellType: UITableViewCell.Type) {
        let nib = UINib(nibName: cellType.identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func register(cellTypes: UITableViewCell.Type...) {
        cellTypes.forEach(register)
    }
    
    func dequeue(cellType: Fillable.Type, for indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = cellType as? UITableViewCell.Type else {
            fatalError("CellType must be a UITableViewCell")
        }
        
        return dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
    }
    
    func reloadWithAnimation(_ animation: UITableView.RowAnimation = .automatic) {
        reloadSections(.init(integersIn: 0..<numberOfSections), with: animation)
    }
}
