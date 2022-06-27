import UIKit

class BottomView: UIView{
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var textView: UITextView!

    private let bottomViewXibName = "BottomView"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.commonInit()

    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit (){
        Bundle.main.loadNibNamed(self.bottomViewXibName,
                                         owner: self,
                                         options: nil)
        self.contentView.addInView(container: self)
    }
    
    func setColor(_ color: Color?) {
        if let color = color {
            self.textView.text = color.description
            self.textView.backgroundColor = color.value
            self.textView.textColor = color.textColor
        }
    }
}
