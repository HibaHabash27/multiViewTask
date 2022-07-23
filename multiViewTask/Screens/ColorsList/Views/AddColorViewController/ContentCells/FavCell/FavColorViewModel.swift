import UIKit

class FavColorViewModel {
    
    var onInitilizedFavColors: (() -> Void)?
    var colors: [UIColor] = []
    var colorOldValue: UIColor?
    var selectedColor = UIColor.clear
    static let identifier = "FavTableViewCell"
    let mySeparator = UIView()

    func initalizeColors() {
        self.colors = [UIColor.red, UIColor.systemPink, UIColor.orange, UIColor.gray, UIColor.yellow, UIColor.brown, UIColor.blue, UIColor.purple, UIColor.systemPurple, UIColor.cyan, UIColor.magenta, UIColor.systemMint,  UIColor.black, UIColor.green, UIColor.darkGray, UIColor.lightGray, UIColor.systemBlue, UIColor.systemCyan, UIColor.systemGreen, UIColor.systemBrown, UIColor.systemIndigo, UIColor.systemOrange, UIColor.systemTeal, UIColor.systemRed, UIColor.systemYellow]
        
        self.onInitilizedFavColors?()
    }
    
    func getColors() -> [UIColor] {
        return self.colors
    }
}

