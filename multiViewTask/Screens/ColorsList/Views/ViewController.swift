import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var bottomView: BottomView!
    @IBOutlet var mainView: UIView!
        
    lazy var colorViewModel: ColorViewModel = {
        let model = ColorViewModel()
        return model
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.colorViewModel.initalizeColors()
        self.topView.setColors(self.colorViewModel.getColors())
        self.topView.delegate = self  // here
    }
    
    /** Bind data to UI that returned from the server
     */
    private func bindViewModel() {

        self.colorViewModel.onInitilizedColors = {
            
        }
    }
}


extension ViewController: TopViewDelegate {
    func didSelectColor (_ color: Color?) {
        self.bottomView.setColor(color)
    }
}
