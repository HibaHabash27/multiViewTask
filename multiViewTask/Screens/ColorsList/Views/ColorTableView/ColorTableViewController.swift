<<<<<<< HEAD
import UIKit
protocol AddColorDelegate{
    func addColor(color:Color)
}
class ColorTableViewController: UIViewController, TopViewDelegate, UINavigationControllerDelegate {
  
    @IBOutlet weak var tableUIView: TopView!

    var colors: [Color] = []
    var selectedColor: Color?
=======


import UIKit

class ColorTableViewController: UIViewController, TopViewDelegate {
  
    @IBOutlet weak var tableUIView: TopView!
    var colors: [Color] = []
    var selectedColor: Color?
    
>>>>>>> 44b82ac510f13f9cbb7cae1ebf7de5250ec8d53f
    lazy var colorViewModel: ColorViewModel = {
        let model = ColorViewModel()
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.colorViewModel.initalizeColors()
        self.tableUIView.setColors(self.colorViewModel.getColors())
        self.tableUIView.delegate = self  // here
        self.title = "Color Table"
        initElements()
        self.setColors(self.colorViewModel.getColors())
<<<<<<< HEAD
=======

>>>>>>> 44b82ac510f13f9cbb7cae1ebf7de5250ec8d53f
    }
    
    private func bindViewModel() {

        self.colorViewModel.onInitilizedColors = {
<<<<<<< HEAD
            //this is to check for updates
=======
            
>>>>>>> 44b82ac510f13f9cbb7cae1ebf7de5250ec8d53f
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
<<<<<<< HEAD
        navigationController?.navigationBar.barStyle = .default //BLACk
    }

    func initElements() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(addColor(sender:)))
        navigationItem.leftBarButtonItem?.tintColor = .label
    }

    @objc func addColor(sender: UIBarButtonItem) {
        let addColorVC = AddColorViewController.loadFromNib()
        addColorVC.delegate = self
        let navVc = UINavigationController(rootViewController: addColorVC)
        self.present(navVc, animated: true)
    }
    
=======
        navigationController?.navigationBar.barStyle = .default
    }

    
    func initElements() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setNeedsStatusBarAppearanceUpdate()
        if  segue.identifier == "showInfoSegue",
            let destination = segue.destination as? ColorInfoViewController
        {
             destination.color = (sender as! Color)
        }

    }


>>>>>>> 44b82ac510f13f9cbb7cae1ebf7de5250ec8d53f
    func setColors(_ colors: [Color]) {
        self.colors = colors
    }
    
    func didSelectColor(_ color: Color?) {
<<<<<<< HEAD
       let colorInfoViewController =  ColorInfoViewController.instantiate(fromAppStoryboard: .Main)
        colorInfoViewController.color = color
        self.navigationController?.pushViewController(colorInfoViewController, animated: true)
    }
}
extension ColorTableViewController: AddColorDelegate {
    func addColor(color: Color) {
        
            self.colors.append(color)   // HERE Check the delegate
        self.tableUIView.reloadView(colors: self.colors)
        
    
        print("color count after adding \(self.colors.count)" )
        print("last color the one added is \(self.colors.last?.name)")
    }
    
    
}
=======
        performSegue(withIdentifier: "showInfoSegue", sender: color)
    }
}
>>>>>>> 44b82ac510f13f9cbb7cae1ebf7de5250ec8d53f

