import Foundation
import UIKit
import CoreData
class ColorViewModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var colorsCD = [Colors]()
    var onInitilizedColors: (() -> Void)?
    var colors: [Color] = []
    
    func getColors() -> [Color] {
        getCoreDataColors()
        return self.colors
    }
    
    
    func getCoreDataColors() {
        self.getCoreDataOrderd()
        self.colors.removeAll()
        for colorCD in colorsCD {
            if let colorName = colorCD.colorName , let colorVal = colorCD.colorValue , let colortext = colorCD.colorValue, let colorID = colorCD.id, let colorDes = colorCD.colorDescription   {
                let colorValue = UIColor(rgb: colorVal)
                let colorTextColor = UIColor(rgb: colortext)
                let colorToAdd = Color(id: colorID, name: colorName, description: colorDes, value: colorValue, textColor: colorTextColor)
                colors.append(colorToAdd)
            }
        }
    }
    
    
    
    func addNewColor(color: Color) {
        _ = convertToCoreDataColor(color: color)
        appDelegate.saveContext()
        
    }
    
    
    func convertToCoreDataColor(color: Color) -> Colors {
        let coreDataColor = Colors(context: context)
        coreDataColor.position = self.getPosition()
        coreDataColor.colorName = color.name
        coreDataColor.colorDescription = color.description
        coreDataColor.colorValue = color.value?.rgbValue()
        coreDataColor.textColor = UIColor.black.rgbValue()
        coreDataColor.id = color.id
        return coreDataColor
    
    }
    
    func getPosition() -> Int64 {
        if colorsCD.count == 0 {
            return Int64(0)
        } else {
            if let position = colorsCD.last?.position {
                return position + 1
            }
        }
        return Int64(0)
    }
    
    func deleteColor(toDeleteColor: Color) {
        var index = 0
        for color in colors {
            if color.id == toDeleteColor.id{
                let colorx = colorsCD[index]
                colorsCD.remove(at: index)
                context.delete(colorx)
                appDelegate.saveContext()
                getCoreDataOrderd()
                colors.remove(at: index)
                return
            }
            index = index + 1
        }
    }
    
    
    func moveRow(from: Int , To: Int) {

        let fromIndex = colorsCD[from].position
        let toIndex = colorsCD[To].position
        getCoreDataOrderd()
        if fromIndex == toIndex {
            return
        } else if fromIndex > toIndex {
            for colors in colorsCD where colors.position > toIndex {
                colors.position = colors.position + 1
            }
            colorsCD[from].position = colorsCD[To].position
            colorsCD[To].position = colorsCD[To].position + 1
          
        } else {
            for colors in colorsCD where colors.position > toIndex {
               
                colors.position = colors.position + 1
                
            }
            colorsCD[from].position = colorsCD[To].position + 1
        }
        appDelegate.saveContext()
    }

    
    
    func deleteColor(index: Int) {
        let color = colorsCD[index]
        context.delete(color)
        appDelegate.saveContext()
        getCoreDataColors()
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
        _ = convertToCoreDataColor(color: color)
        appDelegate.saveContext()
        
    }
    
    
    func editColor(editedColor: Color) {
        var index = 0
        
        for color in colors {
            if color.id == editedColor.id {
                let colorc = colorsCD[index]
                colorc.colorName = editedColor.name
                colorc.colorDescription = editedColor.description
                colorc.colorValue = editedColor.value?.rgbValue()
                appDelegate.saveContext()
                getCoreDataOrderd()
            }
            index = index + 1
        }
    }
    
    func getCoreDataOrderd() {
        let fetchRequest:NSFetchRequest<Colors> = Colors.fetchRequest()
        let positionSort = NSSortDescriptor(key:"position", ascending:true)
        fetchRequest.sortDescriptors = [positionSort]
        do {
            colorsCD = try context.fetch(fetchRequest)
        } catch {
            print("ERORR")
        }
    }
}

