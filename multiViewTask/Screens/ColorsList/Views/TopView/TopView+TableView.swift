import UIKit

extension TopView: UITableViewDelegate,
                   UITableViewDataSource {
   
    enum ColorsCell: String, CaseIterable {
        case ColorCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedColor = colors[indexPath.row]
        self.delegate?.didSelectColor(selectedColor)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorCell.identifier, for: indexPath) as! ColorCell
        cell.setColor(color: colors[indexPath.row])
        return cell
    }
    
    func tableView( _ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView( _ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ColorCell {
            UIView.animate(withDuration: 0.2, animations: {
                cell.highlight()
            })
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ColorCell {
            UIView.animate(withDuration: 0.2, animations: {
                cell.unhighlight()
            })
        }
    }
}
