import UIKit

class ColorInfoViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorDescriptionTextView: UITextView!
    
    var color: Color?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initElements()
        self.title = color?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        self.colorDescriptionTextView.contentInset = UIEdgeInsets(top: 0,
                                                                  left: 10,
                                                                  bottom: 10,
                                                                  right: 10);


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = color?.textColor
        if (color?.textColor == .white){
            navigationController?.navigationBar.barStyle = .black


        }
        else{
            
        }
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]


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
