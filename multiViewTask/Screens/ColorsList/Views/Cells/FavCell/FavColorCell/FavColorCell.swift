

import UIKit

class FavColorCell: UICollectionViewCell {

    static let identifier = "FavColorCell"

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var colorIcon: UIView!
    @IBOutlet weak var midView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorIcon.circledCorners()
        self.colorIcon.addBorder()
        self.midView.circledCorners()
        self.midView.backgroundColor = .clear
        
    }
    
    func setColor(color: UIColor) {
        self.colorIcon.backgroundColor = color
    }
    
    func highlight() {

        self.midView.backgroundColor = .clear
        self.midView.addBorder(3.0,color: UIColor.white)
        //colorIcon.addBorder(5.0)

    }
    func unhighlight() {
        //colorIcon.addBorder(2.5)
    }

}
