import UIKit
class ColorCell: UITableViewCell {
    
    @IBOutlet weak var colorIcon: UIView!
    @IBOutlet weak var colorText: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    let mySeparator = UIView()
    static let identifier = "ColorCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorIcon.circledCorners()
        self.colorIcon.addBorder()
        self.mySeparator.addSeparatorInView(container: self.containerView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.colorIcon.backgroundColor = nil
        self.colorText.text = nil
    }
    
    func setColor(color: Color) {
        self.colorIcon.backgroundColor = color.value
        self.colorText.text = color.name
    }
    
    func highlight() {
        self.containerView.backgroundColor = UIColor(white: 0, alpha: 0.1)
    }
    
    func unhighlight() {
        self.containerView.backgroundColor = .white
    }
    
}
