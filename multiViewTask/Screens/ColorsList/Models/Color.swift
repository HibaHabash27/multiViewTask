import UIKit

class Color {
    
    var id:UUID
    var name: String?
    var description: String?
    var value: UIColor?
    var textColor: UIColor?
    
    init(name: String, description: String, value: UIColor, textColor: UIColor){
        self.id = UUID()
        self.name = name
        self.description = description
        self.value = value
        self.textColor = textColor
    }
    
    init(id: UUID, name: String, description: String, value: UIColor, textColor: UIColor){
        self.id = id
        self.name = name
        self.description = description
        self.value = value
        self.textColor = textColor
    }
    
    init () {
        self.id = UUID()
        self.name = ""
        self.description = ""
        self.value = .clear
        self.textColor = .clear
    }
    
}
