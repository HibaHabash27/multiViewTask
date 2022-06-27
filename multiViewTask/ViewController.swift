import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var bottomView: BottomView!
    @IBOutlet var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.delegate = self
    }
}

extension ViewController: MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(color: Color?) {
        print(color?.name ?? "")
        bottomView.textView.text = color?.description
        bottomView.textView.backgroundColor = color?.value
        if ((color?.value.isLight) == true) {
            bottomView.textView.textColor = UIColor.black
        } else {
            bottomView.textView.textColor = UIColor.white
        }
    }
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.55
    }
}

