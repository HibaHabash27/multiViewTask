

import UIKit

class FavColorCell: UICollectionViewCell {

    static let identifier = "FavColorCell"

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var colorIcon: UIView!
    @IBOutlet weak var selectedIndecator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorIcon.circledCorners()
        self.colorIcon.addBorder()
        self.selectedIndecator.circledCorners()
        self.selectedIndecator.backgroundColor = .clear
        
    }
    
    func setColor(color: UIColor) {
        self.colorIcon.backgroundColor = color
    }
    
    func highlight() {

        self.selectedIndecator.backgroundColor = .clear
        self.selectedIndecator.addBorder(3.0, color: UIColor.white)
        //colorIcon.addBorder(5.0)

    }
    func unhighlight() {
        self.selectedIndecator.removeBorder()
    }

}
