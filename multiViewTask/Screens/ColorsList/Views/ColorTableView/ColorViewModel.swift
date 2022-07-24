import Foundation
import UIKit
class ColorViewModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var colorsCD = [Colors]()
    var onInitilizedColors: (() -> Void)?
    var colors: [Color] = []
    var redDesc = "danger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the past, danger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the pastdanger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the pastdanger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the pastdanger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the pastdanger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the pastdanger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the pastdanger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the past"
    var pinkDesc = "Pink, a delicate color that means sweet, nice, playful, cute, romantic, charming, feminine, and tenderness, is associated with bubble gum, flowers, babies, little girls, cotton candy, and sweetness. The color pink is the color of universal love of oneself and of others"
    var blueDesc = "Blue is a color often found in nature such as the pale blue of a daytime sky or the rich dark blue of a deep pool of water. It is for this reason perhaps that people often describe the color blue as calm and serene. Yet as a cool color, blue can sometimes seem icy, distant, or even cold"
    var yellowDesc = "Yellow is the color of the sun, smiley faces and sunflowers. It's a happy, youthful color, full of hope and positivity. It's another color that grabs your attention and for that reason can also be used to signify caution, like red and orange"
    var purpleDesc = "The Color Purple documents the traumas and gradual triumph of Celie, an African American teenager raised in rural isolation in Georgia, as she comes to resist the paralyzing self-concept forced on her by others. Celie narrates her life through painfully "
    var greenDesc = "with nature and brings to mind lush grass, trees, and forests. Green is often described as a refreshing and tranquil color. Other common associations with the color green are money, luck, health, and envy"
    var grayDesc = "Grey (British English) or gray (American English) is an intermediate color between black and white. It is a neutral or achromatic color, meaning literally that it is colorless, because it can be composed of black and white. It is the color "
    
//    func initalizeColors() {
//        self.colors = [Color(name: "Red",
//                             description: self.redDesc,
//                             value: UIColor.red,
//                             textColor: UIColor.white),
//                       Color(name: "Pink",
//                             description: self.pinkDesc,
//                             value: UIColor.systemPink,
//                             textColor: UIColor.white),
//                       Color(name: "Blue",
//                             description: self.blueDesc,
//                             value: UIColor.blue,
//                             textColor: UIColor.white),
//                       Color(name: "Green",
//                             description: self.greenDesc,
//                             value: UIColor.green,
//                             textColor: UIColor.black),
//                       Color(name: "Yellow",
//                             description: self.yellowDesc,
//                             value: UIColor.yellow,
//                             textColor: UIColor.black),
//                       Color(name: "Purple",
//                             description: self.purpleDesc,
//                             value: UIColor.purple,
//                             textColor: UIColor.white),
//                       Color(name: "Gray",
//                             description: self.grayDesc,
//                             value: UIColor.gray,
//                             textColor: UIColor.white)]
//        self.onInitilizedColors?()
//    }
    
    func getColors() -> [Color] {
        getCoreDataColors()
        print("the initial count of colors \(colorsCD.count)")
        return self.colors
    }
    
    func getCoreDataColors() {
        self.getData()
        self.colors.removeAll()
        var colorValue = UIColor.clear
        var colorTextColor = UIColor.black
        for colorCD in colorsCD {
            let colorName = colorCD.colorName
            if let colorVal = colorCD.colorValue {
                 colorValue = UIColor(hexString: colorVal)
            }
            if let colortext = colorCD.colorValue {
                 colorTextColor = UIColor(hexString: colortext)
            }
            let colorID = colorCD.id
            let colorDes = colorCD.colorDescription
            
            let colorToAdd = Color(id: colorID!, name: colorName!, description: colorDes!, value: colorValue, textColor: colorTextColor)
            
            colors.append(colorToAdd)
            
        }
    }
    
    
    func addNewColor(color: Color) {
        let coreDataColor = Colors(context: context)
        coreDataColor.colorName = color.name
        coreDataColor.colorDescription = color.description
        coreDataColor.colorValue = color.value?.toHexString()
        coreDataColor.textColor = UIColor.black.toHexString()
        coreDataColor.id = color.id
        appDelegate.saveContext()
        self.getData()
        
        
        
        
        self.colors.append(color)
    }
    
    func deleteColor(toDeleteColor: Color) {
        var index = 0
        
        for color in colors {
            
            if color.id == toDeleteColor.id{
                let colorx = colorsCD[index]
                colorsCD.remove(at: index)
                context.delete(colorx)
                appDelegate.saveContext()
                getData()
                colors.remove(at: index)
            }
            index = index + 1
        }
    }
    func deleteColor(index: Int) {
        let color = colorsCD[index]
        colorsCD.remove(at: index)
        context.delete(color)
        appDelegate.saveContext()
        getData()

        print(colorsCD.count)
        colors.remove(at: index)
    }
    
    func getColorByIndex(_ index: Int) -> Color {
        let color = colors[index]
        return color
    }
    
    func getColorCount() -> Int {
        return colors.count
    }
    
    func addColor(_ color: Color, at: Int){
        
        colors.insert(color, at: at)
    }
    
    func editColor(editedColor: Color) {
        var index = 0
        for color in colors {
            
            if color.id == editedColor.id {
                let colorc = colorsCD[index]
                colorc.colorName = editedColor.name
                colorc.colorDescription = editedColor.description
                colorc.colorValue = editedColor.value?.toHexString()
                appDelegate.saveContext()
                getData()
            }
            index = index + 1
        }
    }
    
    func getData() {
        do {
            colorsCD = try context.fetch(Colors.fetchRequest())
        } catch {
            print("ERORR")
        }
    }
}

