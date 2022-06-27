import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var bottomView: BottomView!
    @IBOutlet var mainView: UIView!
    
    private var colorViewModel : ColorViewModel!
    var colors: [Color] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        self.topView.setColors(colorViewModel.getColors()) 
        self.topView.delegate = self  // here
    }
    
    func callToViewModelForUIUpdate(){
          
          self.colorViewModel =  ColorViewModel()
          self.colorViewModel.bindColorViewModelToController = {
              self.updateSomething()
          }
      }
    
    func updateSomething(){
        // we have to write the code to communicate with bottom view
    }
    
}


extension ViewController: MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(color: Color?) {
        self.bottomView.setColor(color)
    }
}
