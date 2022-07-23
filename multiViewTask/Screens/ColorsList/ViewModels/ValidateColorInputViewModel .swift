import UIKit
class ValidateColorInputViewModel {
    
    var isTitleValid = false
    var isColorValid = false
    var isDescriptionValid = false
    var canAddColor:Bool {
        return isColorValid && isTitleValid && isDescriptionValid
    }
}
