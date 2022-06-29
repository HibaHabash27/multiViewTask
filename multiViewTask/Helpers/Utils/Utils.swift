import Foundation
import UIKit

func registerCells(_ cells: [String],_ tableView: UITableView) {
    for cell in cells {
           tableView.register(
            UINib(nibName: cell,
                  bundle: nil),
            forCellReuseIdentifier: cell)
    }
}

func getDisplayDensity() -> CGFloat {
    return 1 / UIScreen.main.scale
}
