import UIKit

    
    public  enum ColorInfo: CaseIterable {
        case red
        case pink
        case blue
        case yellow
        case purple
        
        
        var name: String{
            switch self {
            case .red:
                return "red"
            case .pink:
                return "pink"
            case .blue:
                return "blue"
            case .yellow:
                return "yellow"
            case .purple:
                return "purple"
            }
        }
        
        var description: String {
            switch self {
            case .red:
                return "danger, anger, and adventure. Our prehistoric ancestors saw red as the color of fire and blood – energy and primal life forces – and most of red's symbolism today arises from its powerful associations in the past"
            case .pink:
                return "Pink, a delicate color that means sweet, nice, playful, cute, romantic, charming, feminine, and tenderness, is associated with bubble gum, flowers, babies, little girls, cotton candy, and sweetness. The color pink is the color of universal love of oneself and of others"
            case .blue:
                return "Blue is a color often found in nature such as the pale blue of a daytime sky or the rich dark blue of a deep pool of water. It is for this reason perhaps that people often describe the color blue as calm and serene. Yet as a cool color, blue can sometimes seem icy, distant, or even cold"
            case .yellow:
            return "Yellow is the color of the sun, smiley faces and sunflowers. It's a happy, youthful color, full of hope and positivity. It's another color that grabs your attention and for that reason can also be used to signify caution, like red and orange"
            case .purple:
                return "The Color Purple documents the traumas and gradual triumph of Celie, an African American teenager raised in rural isolation in Georgia, as she comes to resist the paralyzing self-concept forced on her by others. Celie narrates her life through painfully "
            }
        }
        
        var value: UIColor {
            switch self {
            case .red:
                return UIColor.red
            case .pink:
                return UIColor.systemPink
            case .blue:
                return UIColor.blue
            case .yellow:
                return UIColor.yellow
            case .purple:
                return UIColor.purple
            }
        }
    }


