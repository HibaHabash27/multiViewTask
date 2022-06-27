import UIKit

class BottomView: UIView{
    
    @IBOutlet weak var textView: UITextView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.commonInit()

    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        
        
        self.commonInit()

    }
    
    private func commonInit (){
        let bundle = Bundle.init(for: BottomView.self)
        if let viewToAdd = bundle.loadNibNamed("BottomView", owner: self, options: nil),let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
