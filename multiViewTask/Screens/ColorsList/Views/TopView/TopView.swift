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
        self.colorsTable.separatorColor = .red
    }
    
    func setColors(_ colors: [Color]) {
        self.colors = colors
    }
    
    
}




