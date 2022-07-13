//
//  TitleTableViewCell.swift
//  multiViewTask
//
//  Created by fts on 03/07/2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell, UITextFieldDelegate, AddColorProtocol {
    func getData() -> Any? {
        return titleTextField.text
    }
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    let mySeparator = UIView()
    static let identifier = "TitleTableViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mySeparator.addSeparatorInView(container: self.containerView)
        self.titleTextField.delegate = self
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.containerView.endEditing(true)
            return false
        }
   
    
}
