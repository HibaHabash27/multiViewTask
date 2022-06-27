import UIKit

protocol MyDataSendingDelegateProtocol: AnyObject {
    func sendDataToFirstViewController(color: Color?)
}

class TopView: UIView{
    
    @IBOutlet weak var colorsTable: UITableView!
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
        let bundle = Bundle.init(for: TopView.self)
        if let viewToAdd = bundle.loadNibNamed("TopView", owner: self, options: nil),let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            colorsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            colorsTable.delegate = self
            colorsTable.dataSource = self
        }
    }
}

extension TopView: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedColor = colors[indexPath.row]
        //print(selectedColor)
        self.delegate?.sendDataToFirstViewController(color: selectedColor)
    }
}

extension TopView: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = colors[indexPath.row].name
        return cell
    }
}


