import Foundation
import UIKit

extension UICollectionView {
    
    func registerCells(_ cells: String... ) {
        for cell in cells {
               self.register(
                UINib(nibName: cell,
                      bundle: nil),
                forCellWithReuseIdentifier: cell)
        }
    }
    
}

