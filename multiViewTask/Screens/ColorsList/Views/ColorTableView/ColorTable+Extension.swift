import UIKit
extension ColorTableViewController: UITableViewDelegate,
                                     UITableViewDataSource {
    
     enum ColorsCell: String, CaseIterable {
         case ColorCell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 60
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let selectedColor = colorViewModel.getColorByIndex(indexPath.row)
         self.didSelectColor(selectedColor)
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         let count = colorViewModel.getColorCount()
         if  count == 0 {
             let title = String.Localizable.ColorTableEmptyViewTitle.string
             let message = String.Localizable.ColorTableEmptyViewMessage.string
             tableView.setEmptyView(title: title, message: message)
         } else {
             tableView.restore()
         }
         return count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: ColorCell.identifier, for: indexPath) as! ColorCell
         cell.setColor(color: colorViewModel.getColorByIndex(indexPath.row))
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
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
         .delete
     }
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             tableView.beginUpdates()
             colorViewModel.deleteColor(index: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
             tableView.endUpdates()
         }
     }
     
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
         let movedColorTmp = colorViewModel.getColorByIndex(sourceIndexPath.item)
         colorViewModel.deleteColor(index: sourceIndexPath.item)
         colorViewModel.addColor(movedColorTmp, at: destinationIndexPath.item)

     }
     
    
}
