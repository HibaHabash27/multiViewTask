import UIKit
class ColorCell: UITableViewCell {
    
    @IBOutlet weak var colorIcon: UIView!
    @IBOutlet weak var colorText: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    let mySeparator = UIView()
    static let identifier = "ColorCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initColorIcon()
        initSeparator()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.colorIcon.backgroundColor = nil
        self.colorText.text = nil
    }
    
    func initColor(color: Color) {
        self.colorIcon.backgroundColor = color.value
        self.colorText.text = color.name
    }
    
    func highlight() {
        self.containerView.backgroundColor = UIColor(white: 0, alpha: 0.1)
    }
    
    func unhighlight() {
        self.containerView.backgroundColor = .white
    }
    
    func initColorIcon() {
        self.colorIcon.layer.cornerRadius = self.colorIcon.frame.height / 2
        self.colorIcon.layer.borderWidth = getDisplayDensity()
        self.colorIcon.layer.borderColor = UIColor.black.cgColor
    }
    
    func initSeparator() {
        self.mySeparator.backgroundColor = .black
        self.containerView.addSubview(self.mySeparator)
        self.mySeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mySeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                 constant: 0),
            mySeparator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                constant: 0),
            mySeparator.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            mySeparator.heightAnchor.constraint(equalToConstant: getDisplayDensity())
        ])
    }
}
