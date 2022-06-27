import UIKit

protocol MyDataSendingDelegateProtocol: AnyObject {
    func sendDataToFirstViewController(color: Color?)
}

class TopView: UIView{
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet weak var colorsTable: UITableView!
    
    private let topViewXibName = "TopView"
    var colors: [Color] = []
    weak var delegate: MyDataSendingDelegateProtocol? = nil

    
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
        
        colorsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        colorsTable.delegate = self
        colorsTable.dataSource = self
        }
    
    
    func setColors(_ colors: [Color]) {
        self.colors = colors
        
    }
}




