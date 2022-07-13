import UIKit

extension AddColorViewController: UITableViewDelegate,
                   UITableViewDataSource {
   
    enum ContentCell: Int, CaseIterable {
        case TitleCell = 0
        case FavCell = 1
        case DescriptionCell = 2
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cells.count > indexPath.row {
            let cellType = cells[indexPath.row]
            switch cellType {
            case .TitleCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
                return cell
            case .FavCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: FavTableViewCell.identifier, for: indexPath) as! FavTableViewCell
                return cell
            case .DescriptionCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
                return cell
                
            }
            
        }
        return UITableViewCell()
    }
    
}
