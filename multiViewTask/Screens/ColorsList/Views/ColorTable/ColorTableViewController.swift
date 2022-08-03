import UIKit

class ColorTableViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var tableUIView: UITableView!
    
    private let notificationCenter = NotificationCenter.default
    var favColorViewModel: FavColorViewModel?
    lazy var colorViewModel: ColorViewModel = {
        let model = ColorViewModel()
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favColorViewModel = FavColorViewModel()
        self.initElements()
        self.notificationCenter.addObserver(self, selector: #selector(answerEdit), name: .editColor, object: nil)
    }
    
    @objc func answerEdit(notification: NSNotification) {
        if let editedColor = notification.object as? Color {
            self.colorViewModel.editColor(editedColor: editedColor)
        }
        self.setColors(self.colorViewModel.getColors())
        self.tableUIView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default //BLACk
        self.tableUIView.reloadData()
    }

    func initElements() {
        self.title = String.Localizable.ColorTableViewControllerTitle.string
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(addColor(sender:)))
        navigationItem.leftBarButtonItem?.tintColor = .label
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                           target: self,
                                                           action: #selector(editTable(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = .label
        self.tableUIView.registerCells(ColorCell.identifier)
        self.setColors(self.colorViewModel.getColors())
        self.tableUIView.reloadData()
    }

    @objc func addColor(sender: UIBarButtonItem) {
        let addColorVC = AddColorViewController.loadFromNib()
        addColorVC.delegate = self
        addColorVC.addColorViewModel = AddColorViewModel()
        addColorVC.favColorViewModel = self.favColorViewModel
        let navVc = UINavigationController(rootViewController: addColorVC)
        self.present(navVc, animated: true)
    }
    
    @objc func editTable(sender: UIBarButtonItem) {
        self.tableUIView.isEditing = !self.tableUIView.isEditing
        self.changeButton()
        
    }
    
    func setColors(_ colors: [Color]) {
        self.colorViewModel.colors = colors
    }
    
    func didSelectColor(_ color: Color?) {
        let colorInfoVC =  ColorInfoViewController.instantiate(fromAppStoryboard: .Main)
        colorInfoVC.favColorViewModel = self.favColorViewModel
        colorInfoVC.deleteColorDelegate = self
        if let infoColor = color{
            colorInfoVC.colorInfoViewModel = ColorInfoViewModel(color: infoColor)
        }
        self.navigationController?.pushViewController(colorInfoVC, animated: true)
    }
    
    func changeButton() {
        if self.tableUIView.isEditing {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(editTable(sender:)))
            
        } else {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                           target: self,
                                                            action: #selector(editTable(sender:)))
        }
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
}


extension ColorTableViewController: DeleteColorDelegate {
    
    func deleteColor(toDeleteColor: Color) {
        self.colorViewModel.deleteColor(toDeleteColor: toDeleteColor )
        self.setColors(self.colorViewModel.getColors())
        self.tableUIView.reloadData()
    }
}

extension ColorTableViewController: AddColorDelegate {
    func addColor(color: Color) {
        self.colorViewModel.addNewColor(color: color)
        self.setColors(self.colorViewModel.getColors())
        self.tableUIView.reloadData()
    }
    
}




