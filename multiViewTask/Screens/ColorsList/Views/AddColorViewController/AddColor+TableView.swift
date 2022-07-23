import UIKit

extension AddColorViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cells = addColorViewModel?.cells{
            return cells.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let isAddMode = self.addColorViewModel?.isAdd {
            if let cells = addColorViewModel?.getCells(){
                if cells.count > indexPath.row {
                    let cellType = cells[indexPath.row]  // take it from viewModel
                    switch cellType {
                    case .TitleCell:
                        let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
                        cell.sendTitleDelegate = self
                        cell.validateInputDelegate = self
                        if !isAddMode {
                            cell.titleTextField.text = self.addColorViewModel?.getColorName()
                            cell.sendInputValidation()
                        }
                        return cell
                    case .FavCell:
                        let cell = tableView.dequeueReusableCell(withIdentifier: FavTableViewCell.identifier, for: indexPath) as! FavTableViewCell
                        cell.sendSelectedColorDelegate = self 
                        cell.validateInputDelegate = self
                        if !isAddMode {
                            cell.favColorViewModel.colorOldValue = self.addColorViewModel?.getColorValue()
                        }
                        return cell
                    case .DescriptionCell:
                        let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
                        cell.sendDescriptionDelegate = self
                        cell.validateInputDelegate = self
                        if !isAddMode {
                            cell.colorDescriptionTextView.text = self.addColorViewModel?.getColorDescription()
                            cell.sendValidation()
                        }
                        return cell
                    }
                }
            }
            
        }
        
        return UITableViewCell()
    }
    
}
