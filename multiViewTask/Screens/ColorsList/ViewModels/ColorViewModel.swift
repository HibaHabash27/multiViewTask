import Foundation
import UIKit
class ColorViewModel {
    
    var onInitilizedColors: (() -> Void)?
    var colors: [Color] = []
    
    func initalizeColors() {
        self.colors = [Color(name: "Red", description: "Red desc", value: UIColor.red, textColor: UIColor.white),
                       Color(name: "Pink", description: "Pink desc", value: UIColor.systemPink, textColor: UIColor.white),
                       Color(name: "Blue", description: "Blue desc", value: UIColor.blue, textColor: UIColor.white),
                       Color(name: "Green", description: "Green desc", value: UIColor.green, textColor: UIColor.black),
                       Color(name: "Yellow", description: "Yellow desc", value: UIColor.yellow, textColor: UIColor.black),
                       Color(name: "Purple", description: "Purple desc", value: UIColor.purple, textColor: UIColor.white),
                       Color(name: "Gray", description: "Gray desc", value: UIColor.gray, textColor: UIColor.white)]
        
        self.onInitilizedColors?()
    }
    
    func getColors() -> [Color] {
        return self.colors
    }
}

