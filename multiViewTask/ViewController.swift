import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var bottomView: BottomView!
    @IBOutlet var mainView: UIView!
    
    var colors = [Color(name: "Red", description: "Red desc", value: UIColor.red, textColor: UIColor.white),
                  Color(name: "Pink", description: "Pink desc", value: UIColor.systemPink, textColor: UIColor.white),
                  Color(name: "Blue", description: "Blue desc", value: UIColor.blue, textColor: UIColor.white),
                  Color(name: "Green", description: "Green desc", value: UIColor.green, textColor: UIColor.black),
                  Color(name: "Yellow", description: "Yellow desc", value: UIColor.yellow, textColor: UIColor.black),
                  Color(name: "Purple", description: "Purple desc", value: UIColor.purple, textColor: UIColor.white),
                  Color(name: "Gray", description: "Gray desc", value: UIColor.gray, textColor: UIColor.white)]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.colors = colors
        self.topView.delegate = self
    }
}

extension ViewController: MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(color: Color?) {
        bottomView.textView.text = color?.description
        bottomView.textView.backgroundColor = color?.value
        bottomView.textView.textColor = color?.textColor
    }
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.55
    }
}

