import UIKit
protocol AddColorProtocol: AnyObject {
    func getData() -> Any?
}
class AddColorViewController: UIViewController {

    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet var containerView: UIView!

    var colors: [Color] = []
    var cells: [ContentCell] = [.TitleCell, .FavCell, .DescriptionCell]
    var colorName = ""
    var colorDescription = ""
    var colorValue = UIColor.clear
    var delegate: AddColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initNav() {
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addColor))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeView))
        self.title = "Add Color"
        self.navigationItem.leftBarButtonItem = addItem
        self.navigationItem.rightBarButtonItem = cancelItem
    }
    
    private func initView(){
        initTable()
        initNav()
        checkKeyboard()
    }
    
    private func initTable() {
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
        for cell in cells {
            switch cell {
            case .TitleCell:
                if let cell = contentTableView.cellForRow(at: IndexPath(row: cell.rawValue, section: 0)) as? AddColorProtocol {
                    let colorName: String? = cell.getData() as? String
                    self.colorName = colorName!
                }
            case .FavCell:
                if let cell = contentTableView.cellForRow(at: IndexPath(row: cell.rawValue, section: 0)) as? AddColorProtocol {
                    let color: UIColor? = cell.getData() as? UIColor
                    self.colorValue = color!
                }
            case .DescriptionCell:
                if let cell = contentTableView.cellForRow(at: IndexPath(row: cell.rawValue, section: 0)) as? AddColorProtocol {
                    let description: String? = cell.getData() as? String
                    self.colorDescription = description!
                }
            }
        }
        if (colorName == "" || colorValue == UIColor.clear || colorDescription == "" ){
            let uialert = UIAlertController(title: "Something Is Wrong", message: "Before adding the color please make sure you filled all the necceary fields.", preferredStyle: UIAlertController.Style.alert)
               uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(uialert, animated: true, completion: nil)
        }else{
        let color = Color(name: colorName, description: colorDescription, value: colorValue, textColor: UIColor.black)
        self.delegate?.addColor(color: color)
            self.presentingViewController?.dismiss(animated: true, completion:nil)}

    }
}
