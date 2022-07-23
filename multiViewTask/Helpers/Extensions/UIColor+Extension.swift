import UIKit
extension UIColor {
    
    private func makeColor(componentDelta: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        

        getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )

        return UIColor(
            red: add(componentDelta, toComponent: red),
            green: add(componentDelta, toComponent: green),
            blue: add(componentDelta, toComponent: blue),
            alpha: alpha
        )
    }
    
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
           return max(0, min(1, toComponent + value))
       }
    
    func lighter(componentDelta: CGFloat = 0.2) -> UIColor {
            return makeColor(componentDelta: componentDelta)
        }
    
    func darker(componentDelta: CGFloat = 0.2) -> UIColor {
        return makeColor(componentDelta: -1*componentDelta)
    }
    

    
    func isLight() -> Bool {
            if let colorSpace = self.cgColor.colorSpace {
                if colorSpace.model == .rgb {
                    guard let components = cgColor.components, components.count > 2 else {return false}

                    let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000

                    return (brightness > 0.5)
                }
                else {
                    var white : CGFloat = 0.0

                    self.getWhite(&white, alpha: nil)

                    return white >= 0.5
                }
            }

            return false
        }
    
}
