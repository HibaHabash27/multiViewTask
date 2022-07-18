import UIKit
class TopView: UIView{
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet weak var colorsTable: UITableView!
    private let topViewXibName = "TopView"
    var colors: [Color] = []
    weak var delegate: TopViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(self.topViewXibName,
                                 owner: self,
                                 options: nil)
        self.contentView.addInView(container: self)
        self.colorsTable.registerCells(ColorCell.identifier)
    }
    
    func setColors(_ colors: [Color]) {
        self.colors = colors
    }
    
<<<<<<< HEAD
    func reloadView(colors: [Color]) {
        self.colors = colors
        self.colorsTable.reloadData()
    }
    
=======
>>>>>>> 44b82ac510f13f9cbb7cae1ebf7de5250ec8d53f
    
}




