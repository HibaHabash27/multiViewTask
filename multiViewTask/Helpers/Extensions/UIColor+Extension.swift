import UIKit
extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
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
