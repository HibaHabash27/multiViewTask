import UIKit

protocol SendDescriptionDelegate {
    func sendDescription(description: String)
}


class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorDescriptionTextView: UITextView!
    @IBOutlet weak var descriptionTitleLable: UILabel!
    
    static let identifier = "DescriptionTableViewCell"
    let mySeparator = UIView()
    var sendDescriptionDelegate: SendDescriptionDelegate?
    var validateInputDelegate:ValidateInputDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mySeparator.addSeparatorInView(container: self.contentView)
        self.descriptionTitleLable.text = String.Localizable.DescriptionCellLableText.string
        self.initTextView()
        self.sendValidation()
        self.sendDescription()
     
        
    }
    
    func sendDescription() {
        if let description = self.colorDescriptionTextView.text {
            self.sendDescriptionDelegate?.sendDescription(description: description)

        }
    }
    
    
    func initTextView() {
        self.colorDescriptionTextView.delegate = self
        self.colorDescriptionTextView.sizeToFit()
        self.colorDescriptionTextView.isScrollEnabled = false
        self.colorDescriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }

}

extension DescriptionTableViewCell: AddColorProtocol{
    
    func getData() -> Any? {
        return colorDescriptionTextView.text
    }
    
}
//Markup: 
extension DescriptionTableViewCell: UITextViewDelegate {
    
    
    func textViewDidChange(_ textView: UITextView) {
        self.sendValidation()
        self.sendDescription()
    }
    
    func sendValidation() {
        if self.colorDescriptionTextView.text.isEmpty {
            self.validateInputDelegate?.validateInput(isValid: false, inputType: .DescriptionCell)
        } else {
            self.validateInputDelegate?.validateInput(isValid: true, inputType: .DescriptionCell)
        }
        
    }
    
}
