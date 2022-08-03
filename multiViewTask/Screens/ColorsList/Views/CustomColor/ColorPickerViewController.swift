import IGColorPicker
import UIKit

protocol SendNewColor {
    func sendNewColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var colorPickerView: ColorPickerView!
    weak var sendNewColorDelegate: SendColorDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorPickerView.delegate = self
        self.colorPickerView.layoutDelegate = self
        self.colorPickerView.style = .circle
        self.colorPickerView.selectionStyle = .check
        self.colorPickerView.isSelectedColorTappable = true
        self.titleLable.text = String.Localizable.CustomColorViewTitleLableText.string
        
    }
}

extension ColorPickerViewController: ColorPickerViewDelegate {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
        let color = colorPickerView.colors[colorPickerView.indexOfSelectedColor!]
        self.sendNewColorDelegate?.sendNewColor(color: color)
        self.dismiss(animated: true)
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath) {
    }
    
}

extension ColorPickerViewController: ColorPickerViewDelegateFlowLayout {
    
    
    func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10.0
    }
    
    
}


