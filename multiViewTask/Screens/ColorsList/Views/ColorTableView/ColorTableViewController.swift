

import UIKit

class ColorTableViewController: UIViewController, TopViewDelegate {
  
    @IBOutlet weak var tableUIView: TopView!
    var colors: [Color] = []
    var selectedColor: Color?
    
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

    }
    
    private func bindViewModel() {

        self.colorViewModel.onInitilizedColors = {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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


    func setColors(_ colors: [Color]) {
        self.colors = colors
    }
    
    func didSelectColor(_ color: Color?) {
        performSegue(withIdentifier: "showInfoSegue", sender: color)
    }
}

