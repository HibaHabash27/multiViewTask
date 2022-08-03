import UIKit
protocol SendTitleDelegate {
    func sendTitle(title: String)
}
class TitleTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var colorTitleLable: UILabel!
    
    let mySeparator = UIView()
    static let identifier = "TitleTableViewCell"
    var validateInputDelegate: ValidateInputDelegate?
    var sendTitleDelegate: SendTitleDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.mySeparator.addSeparatorInView(container: self.containerView)
        self.colorTitleLable.text = String.Localizable.TitleCellLabelText.string
        self.titleTextField.delegate = self
        self.sendTitle()
        self.titleTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.containerView.endEditing(true)
        return false
    }
    
    func getData() -> Any? {
        return titleTextField.text
    }
    
    func sendTitle() {
        if let title = self.titleTextField.text {
            self.sendTitleDelegate?.sendTitle(title: title)
        }
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.sendInputValidation()
        self.sendTitle()
        if (textField.text!.isEmpty) {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1
            self.warningLabel.isHidden = false
        } else {
            textField.layer.borderWidth = 0
            self.warningLabel.isHidden = true
        }
    }
    
    func sendInputValidation() {
        if self.titleTextField.text?.isEmpty == true {
            self.validateInputDelegate?.validateInput(isValid: false, inputType: .TitleCell)
        } else {
            self.validateInputDelegate?.validateInput(isValid: true, inputType: .TitleCell)
        }
    }
    
    
}
