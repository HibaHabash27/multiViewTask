//
//  DescriptionTableViewCell.swift
//  multiViewTask
//
//  Created by fts on 03/07/2022.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell, AddColorProtocol {
    func getData() -> Any? {
        return colorDescriptionTextView.text
    }
    

    @IBOutlet weak var colorDescriptionTextView: UITextView!
    
    static let identifier = "DescriptionTableViewCell"
    let mySeparator = UIView()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mySeparator.addSeparatorInView(container: self.contentView)
        self.colorDescriptionTextView.sizeToFit()
        self.colorDescriptionTextView.isScrollEnabled = false
        // self.colorDescriptionTextView.delegate = self
        self.colorDescriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
                
    }
    
    func getText() -> String {
        if colorDescriptionTextView.text != nil{
            return colorDescriptionTextView.text!}
        else{
            return ""
        }
    }
    
}
