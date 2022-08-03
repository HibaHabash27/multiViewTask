import UIKit

extension AddColorViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let isAddMode = self.addColorViewModel?.isAdd  {
            if !isAddMode {
                self.favColorViewModel?.colorOldValue = self.addColorViewModel?.getColorValue()
                if let isCustomColor = self.favColorViewModel?.isCustomColor {
                    self.addColorViewModel?.showCustomColorCell = !isAddMode && isCustomColor
                }
            }
            
        }
        if let cells = addColorViewModel?.cells{
            print(cells.count)
            return cells.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let isAddMode = self.addColorViewModel?.isAdd  {
            if !isAddMode {
                self.favColorViewModel?.colorOldValue = self.addColorViewModel?.getColorValue()
                if let isCustomColor = self.favColorViewModel?.isCustomColor {
                    self.addColorViewModel?.showCustomColorCell = !isAddMode && isCustomColor
                } 
            }
            if let cells = addColorViewModel?.cells {
                if cells.count > indexPath.row {
                    let cellType = cells[indexPath.row]
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
                        cell.favColorViewModel = self.favColorViewModel
                        cell.openCustomColorViewDelegate = self
                        if !isAddMode {
                            cell.favColorViewModel?.colorOldValue = self.addColorViewModel?.getColorValue()
                        }
                        cell.configCell()
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
                    case .CustomCell:
                        let cell = tableView.dequeueReusableCell(withIdentifier: CustomColorCell.identifier, for: indexPath) as! CustomColorCell
                        cell.favColorViewModel = self.favColorViewModel
                        cell.validateInputDelegate = self
                        cell.addColorDelegate = self
                        cell.customColorCellViewModel = self.customColorCellViewModel
                        
                        if  self.favColorViewModel?.isCustomColor == true {
                            cell.customColorCellViewModel?.color = self.favColorViewModel?.colorOldValue
                            cell.colorView.backgroundColor = self.favColorViewModel?.colorOldValue
                        } else {
                            cell.isHidden = true
                        }
                        cell.sendValidation()
                        return cell
                    }
                }
                
            }
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 2 {
            let cell =  self.contentTableView.cellForRow(at: indexPath) as! CustomColorCell
            if cell.isHidden == true {
                return
            }
            if cell.customColorCellViewModel?.isSelected == true {
                cell.unhighlight()
            } else {
                cell.highlight()
            }
        }
    }
    
    
}


