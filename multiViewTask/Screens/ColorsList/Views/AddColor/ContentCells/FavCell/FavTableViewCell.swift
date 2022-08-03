import UIKit
import IGColorPicker

protocol SendColorDelegate: AnyObject {
    func sendcolor(colorValue: UIColor)
    func sendNewColor(color: UIColor)
}

protocol OpenCustomColorViewDelegate: AnyObject {
    func openCustomColorView()
}

class FavTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customColorButtom: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var colroCellTitle: UILabel!
    let mySeparator = UIView()
    
    static let identifier = "FavTableViewCell"
    weak var validateInputDelegate: ValidateInputDelegate?
    weak var sendSelectedColorDelegate: SendColorDelegate?
    weak var openCustomColorViewDelegate: OpenCustomColorViewDelegate?
    var favColorViewModel: FavColorViewModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.validateInputDelegate?.validateInput(isValid: false, inputType: .FavCell)
        self.colroCellTitle.text = String.Localizable.ColorCellLableText.string
        self.initCollectionView()
        self.addSeparator()
        let title = String.Localizable.FavColorCellAddCustomColorButtonTitle.string
        self.customColorButtom.setTitle(title, for: .normal)
    }
    

    func configCell() {
//        if let color = self.favColorViewModel?.colors.last {
//        self.favColorViewModel?.selectedColor = color
//            }
        self.colorsCollectionView.reloadData()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureCollectionViewLayoutItemSize()
    }
    
    private func configureCollectionViewLayoutItemSize() {
        let leftInset: CGFloat = 10
        let rightInset: CGFloat = 10
        let itemWidth = self.frame.size.width - 40
        self.collectionViewLayout.sectionInset = UIEdgeInsets(top: -5, left: leftInset, bottom: 0, right: rightInset)
        self.collectionViewLayout.itemSize = CGSize(width: itemWidth, height: 260)
        self.collectionViewLayout?.minimumLineSpacing = 0
        self.collectionViewLayout?.minimumInteritemSpacing = 0
    }
    
    private func initCollectionView() {
        self.colorsCollectionView.delegate = self
        self.colorsCollectionView.dataSource = self
        self.colorsCollectionView.registerCells(FavColorCell.identifier)
    }
    
    private func addSeparator() {
        self.mySeparator.addSeparatorInView(container: self.containerView)
    }
    
    private func bindViewModel() {
        self.favColorViewModel?.onInitilizedFavColors = {

        }
    }
    
    func getSelectedColor() -> UIColor {
        if let color = self.favColorViewModel?.selectedColor{
            return color
        }
        return .clear
    }
    
    func getData() -> Any? {
        return self.favColorViewModel?.selectedColor
    }
    
    @IBAction func addCustomColor(_ sender: Any) {
        if let selectedIndex = self.colorsCollectionView.indexPathsForSelectedItems?.first {
            if let cell = colorsCollectionView.cellForItem(at: selectedIndex) as? FavColorCell {
                UIView.animate(withDuration: 0.2, animations: {
                    cell.unhighlight()
                })
            }
        }
        self.openCustomColorViewDelegate?.openCustomColorView()
    }
    
}


