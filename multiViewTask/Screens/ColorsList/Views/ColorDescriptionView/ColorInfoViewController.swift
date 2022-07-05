import UIKit

class ColorInfoViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorDescriptionTextView: UITextView!
    
    var color: Color?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = color?.textColor
        if (color?.textColor == .white){
            navigationController?.navigationBar.barStyle = .black
        }
        else{
        
            UIApplication.shared.statusBarStyle = .darkContent // This does not work

        }
    }
    

    
    func initElements() {
        
        self.colorNameLabel.text = self.color?.name
        self.colorNameLabel.textColor = self.color?.textColor
        self.colorDescriptionTextView?.text = self.color?.description
        self.containerView.backgroundColor = self.color?.value
        self.colorDescriptionTextView.textColor = self.color?.textColor
        self.colorDescriptionTextView.backgroundColor = self.color?.value
    
        
    }

}
