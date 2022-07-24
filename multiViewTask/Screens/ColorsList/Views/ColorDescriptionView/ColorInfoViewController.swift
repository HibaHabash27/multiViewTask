import UIKit
protocol DeleteColorDelegate {
    func deleteColor(toDeleteColor: Color)
}
class ColorInfoViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var colorDescriptionTextView: UITextView!
    @IBOutlet weak var deleteColorButton: UIButton!
     
    var colorInfoViewModel:ColorInfoViewModel?
    private let notificationCenter = NotificationCenter.default
    var deleteColorDelegate: DeleteColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initElements()
        
        notificationCenter.addObserver(self, selector: #selector(answerEdit), name: .editColor, object: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        self.colorDescriptionTextView.contentInset = UIEdgeInsets(top: 0,
                                                                  left: 10,
                                                                  bottom: 10,
                                                                  right: 10);
    }
    func setButtonColor() {
        if let color = self.colorInfoViewModel?.getColorValue(){
            if color == .red {
                self.deleteColorButton.tintColor = .white
                return
            }
            if color.isLight() {
                self.deleteColorButton.tintColor = color.darker()
            } else {
                self.deleteColorButton.tintColor = color.lighter()

            }
        }
    }
    
    @objc func answerEdit(notification: NSNotification){
        if let editedColor = notification.object as? Color {
            colorInfoViewModel?.color? = editedColor
            self.initElements()
        }
    }
    
    @IBAction func deleteColorAction(_ sender: Any) {
        if let colorName = colorInfoViewModel?.color?.name {
        self.confirmDelete(colorName: colorName)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let editColor = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editColor(sender:)))
        self.navigationItem.rightBarButtonItem = editColor
        super.viewWillAppear(animated)
       
    }
    
    func confirmDelete(colorName: String) {
        let title = String.Localizable.ColorInfoConfirmDeleteTitle.string
        let message = String.Localizable.ColorInfoConfirmDeleteMsG.string
        let deleteTitle = String.Localizable.ColorInfoConfirmDeleteButton.string
        let cancelTitle = String.Localizable.ColorInfoConfirmDeleteCancelButton.string
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: deleteTitle, style: .destructive, handler: handleDeleteColor)
        let CancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
             
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func handleDeleteColor(alertAction: UIAlertAction!) {
        if let color = colorInfoViewModel?.color {
            deleteColorDelegate?.deleteColor(toDeleteColor: color)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
        
    }
    func cancelDeleteColor(alertAction: UIAlertAction!){
        
    }

    
    @objc func editColor(sender: UIBarButtonItem) {
        let editColorVC = AddColorViewController.loadFromNib()
        editColorVC.addColorViewModel = AddColorViewModel(self.colorInfoViewModel?.color)
        let navVc = UINavigationController(rootViewController: editColorVC)
        self.present(navVc, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    
    
    func initElements() {
        self.setButtonColor()
        self.colorDescriptionTextView?.text = self.colorInfoViewModel?.getColorDescription()
        self.containerView.backgroundColor = self.colorInfoViewModel?.getColorValue()
        self.colorDescriptionTextView.backgroundColor = self.colorInfoViewModel?.getColorValue()

        self.colorDescriptionTextView.textColor = .black
        self.title = self.colorInfoViewModel?.getColorName()
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = .black
        if (self.colorInfoViewModel?.color?.textColor == .white) {
            navigationController?.navigationBar.barStyle = .black
        }
    
    }
     

}


