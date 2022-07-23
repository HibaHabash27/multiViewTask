import UIKit
protocol AddColorProtocol: AnyObject {
    func getData() -> Any?
}
class AddColorViewController: UIViewController, ValidateInputDelegate {
    
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet var containerView: UIView!
    
    private let notificationCenter = NotificationCenter.default
    var delegate: AddColorDelegate?
    var addColorViewModel:AddColorViewModel?  // this is not used yet
    var validateColorInputViewModel:ValidateColorInputViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        validateColorInputViewModel = ValidateColorInputViewModel ()
        
        
    }
    
    private func initNav() {
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeView))
        if let isAddMode = self.addColorViewModel?.isAdd {
        let rightItem = isAddMode ? UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addColor)) :  UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addColor))
        self.title = isAddMode ?  String.Localizable.AddViewControllerTitle.string: String.Localizable.EditViewControllerTitle.string
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem?.tintColor = .label
        self.navigationItem.leftBarButtonItem = cancelItem
            self.navigationItem.leftBarButtonItem?.tintColor = .label
            
        }
    }
    
    private func initView() {
        initContentTable()
        initNav()
        checkKeyboard()
    }
    
    private func initContentTable() {
        self.contentTableView.registerCells(TitleTableViewCell.identifier, FavTableViewCell.identifier, DescriptionTableViewCell.identifier)
        self.contentTableView.estimatedRowHeight = 600
        self.contentTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func checkKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo
        if let keyboardRect = info?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect {
            let keyboardSize = keyboardRect.size
            
            self.contentTableView.contentInset = UIEdgeInsets(top: 0, left: 0,
                                                              bottom: keyboardSize.height + 60, right: 0) // 20 is a margin
            self.contentTableView.scrollIndicatorInsets = self.contentTableView.contentInset
        }
    }
    
    @objc func closeView() {
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    @objc func addColor() {
        
        self.addColorViewModel?.setTextColor(.black)
        guard let color = self.addColorViewModel?.getColor() else {return}
        if let isAddMode = self.addColorViewModel?.isAdd{
            if isAddMode{
                self.delegate?.addColor(color: color )
            } else {
                self.notificationCenter.post(name: .editColor, object: color)
            }
            self.presentingViewController?.dismiss(animated: true, completion:nil)
            
        }
        
    }
    
    func validateInput(isValid: Bool, inputType: ContentCell) {
        switch inputType {
        case .TitleCell:
            self.validateColorInputViewModel?.isTitleValid = isValid
        case .FavCell:
            self.validateColorInputViewModel?.isColorValid = isValid
        case .DescriptionCell:
            self.validateColorInputViewModel?.isDescriptionValid = isValid
        }
        if ((validateColorInputViewModel?.canAddColor) == true) {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
        
    }
    
}

extension AddColorViewController:  SendColorDelegate, SendTitleDelegate, SendDescriptionDelegate {
    
    func sendTitle(title: String) {
        self.addColorViewModel?.setColorName(title)
    }
    
    func sendDescription(description: String) {
        self.addColorViewModel?.setColorDescription(description)
    }

    func sendcolor(colorValue: UIColor) {
        self.addColorViewModel?.setColorValue(colorValue)
    }
    
}


