import UIKit

class FavColorViewModel {
    
    var onInitilizedFavColors: (() -> Void)?
    var colors: [UIColor] = []

    func initalizeColors() {
        self.colors = [UIColor.red, UIColor.systemPink, UIColor.orange, UIColor.gray, UIColor.yellow, UIColor.brown, UIColor.blue, UIColor.purple, UIColor.systemPurple, UIColor.cyan, UIColor.green, UIColor.magenta, UIColor.systemMint,UIColor.red, UIColor.systemPink, UIColor.orange, UIColor.gray, UIColor.yellow, UIColor.brown, UIColor.blue, UIColor.purple,UIColor.red, UIColor.systemPink, UIColor.orange, UIColor.black, UIColor.gray, UIColor.yellow, UIColor.brown, UIColor.blue, UIColor.purple, UIColor.systemPurple, UIColor.cyan, UIColor.green, UIColor.magenta, UIColor.systemMint]
        
        self.onInitilizedFavColors?()
    }
    
    func getColors() -> [UIColor] {
        return self.colors
    }
}

