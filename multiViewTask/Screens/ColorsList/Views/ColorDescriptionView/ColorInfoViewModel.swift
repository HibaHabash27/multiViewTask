import Foundation
import UIKit

class ColorInfoViewModel {
    var color:Color?
    
    init(color: Color) {
        self.color = color
    }
    
    func getColorName() -> String {
        if let colorName = self.color?.name {
            return colorName
        }
        return ""
    }
    
    func getColorDescription() -> String {
        if let colorDescription = self.color?.description {
            return colorDescription
        }
        return ""
    }
    
    func getColorValue() -> UIColor {
        if let colorValue = self.color?.value {
            return colorValue
        }
        return .clear
    }
    
    func getTextColor() -> UIColor {
        if let colorValue = self.color?.textColor {
            return colorValue
        }
        return .clear
    }
    

}
