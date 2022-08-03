import UIKit
extension UIColor {
    
    convenience init(rgb: String, alpha: CGFloat = 1.0) {
        let RGB = rgb.split(separator: ".")
        let r = Int(RGB[0])!
        let g = Int(RGB[1])!
        let b = Int(RGB[2])!
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            self.init(red:red, green:green, blue:blue, alpha:alpha)
        }

    
    
    
    func rgbValue() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb = String(Int(r*255)) + "." + String(Int(g*255)) + "." + String(Int(b*255))
        return rgb
    }
    
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
