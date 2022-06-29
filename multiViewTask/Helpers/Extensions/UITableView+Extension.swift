import Foundation
import UIKit

extension UITableView {
    
    func registerCells(_ cells: String... ) {
        for cell in cells {
               self.register(
                UINib(nibName: cell,
                      bundle: nil),
                forCellReuseIdentifier: cell)
        }
    }
    
}
