import UIKit
class AddColorViewModel {
    
    var color: Color?
    var showCustomColorCell: Bool = false
    var cells: [ContentCell] {
        if showCustomColorCell {
            return [.TitleCell, .FavCell, .CustomCell, .DescriptionCell]
        } else {
            return [.TitleCell, .FavCell, .DescriptionCell]
        }
        
    }
    var isAdd:Bool?
    var id:UUID?
    var name:String?
    var description: String?
    var colorValue: UIColor?
    var textColor: UIColor?
    var selectedColor:UIColor?
    
    func getCells() -> [ContentCell] {
        return cells
    }
    
    init(_ color: Color? = nil) {
        guard let viewModelColor = color else {
            isAdd = true
            return
        }
        isAdd = false
        self.color = viewModelColor
        self.name = self.color?.name
        self.colorValue = self.color?.value
        self.description = self.color?.description
        self.textColor = self.color?.textColor
    }
    
    init (color: Color, isAdd: Bool){
        self.isAdd = isAdd
        self.color = color
    }
    
    func getColor() -> Color {
        if isAdd == true {
            self.color = Color ()  // This is because we only want to create an object if the add button is clicked
            self.color?.textColor = .black
        }
        self.color?.name = self.name
        self.color?.description = self.description
        self.color?.value = self.colorValue
        if let sentcolor = self.color  {
            return sentcolor
        }
        return Color()
    }
    
    func setColorName(_ colorName: String ) {
        self.name = colorName
    }
    
    func setColorDescription(_ description: String ) {
        self.description = description
    }
    
    func setColorValue(_ colorValue: UIColor ) {
        self.colorValue = colorValue
    }
    
    func setTextColor(_ color: UIColor) {
        self.textColor = color
    }
    
    func getColorName() -> String {
        guard let colorName = self.name else {
            return "NO NAME"
        }
        return colorName
    }
    
    func getColorDescription() -> String {
        guard let colorDesc = self.description else {
            return "NO DESCRIPTION"
        }
        return colorDesc
    }
    
    func getColorValue() -> UIColor {
        guard let colorValue = self.colorValue else {
            return .clear
        }
        return colorValue
    }
    
    func getTextColor() -> UIColor {
        guard let textColor = self.textColor else {
            return .clear
        }
        return textColor
    }
    
    
}
