//
//  CustomColorCellTableViewCell.swift
//  multiViewTask
//
//  Created by fts on 28/07/2022.
//

import UIKit

class CustomColorCell: UITableViewCell {

    static let identifier = "CustomColorCell"
    var favColorViewModel: FavColorViewModel?
    weak var validateInputDelegate: ValidateInputDelegate?
    weak var addColorDelegate: SendColorDelegate?
    var customColorCellViewModel: CustomColorCellViewModel?
    
    @IBOutlet weak var selectedIndecator: UIView!
    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorView.circledCorners()
        self.colorView.addBorder()
        self.selectedIndecator.backgroundColor = .clear
        self.selectedIndecator.circledCorners()
        self.highlight()
        self.colorView.backgroundColor = self.customColorCellViewModel?.color
    }
   
    func highlight() {
        self.selectedIndecator.addBorder(3.0, color: UIColor.white)
        self.customColorCellViewModel?.isSelected = true
        self.sendValidation()
        self.addColorDelegate?.sendcolor(colorValue: (self.customColorCellViewModel?.color)!)
    }
    
    func unhighlight() {

        self.selectedIndecator.removeBorder()
        self.customColorCellViewModel?.isSelected = false
        self.sendValidation()

    }
    
    func sendValidation() {
        if let isValid =  self.customColorCellViewModel?.isSelected {
            validateInputDelegate?.validateInput(isValid: isValid, inputType: .CustomCell)
            
        }

      
    }
    
}
