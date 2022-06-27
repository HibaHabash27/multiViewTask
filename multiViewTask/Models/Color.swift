import UIKit

class Color {
    
    var name: String?
    var description: String?
    var value: UIColor?
    var textColor: UIColor?
    
    init(name: String, description: String, value: UIColor, textColor: UIColor){
        self.name = name
        self.description = description
        self.value = value
        self.textColor = textColor
    }
    
}
