import UIKit

protocol SendColorDelegate{
    func sendcolor(colorValue: UIColor)
}

class FavTableViewCell: UITableViewCell, AddColorProtocol {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var colroCellTitle: UILabel!
    let mySeparator = UIView()

    var validateInputDelegate: ValidateInputDelegate?
    var sendSelectedColorDelegate: SendColorDelegate?
    lazy var favColorViewModel: FavColorViewModel = {
        let model = FavColorViewModel()
        return model
    }()
    static let identifier = "FavTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.validateInputDelegate?.validateInput(isValid: false, inputType: .FavCell)
        self.colroCellTitle.text = String.Localizable.ColorCellLableText.string
        self.initViewModel()
        self.initCollectionView()
        self.addSeparator()
    }
    
    private func initViewModel() {
        self.favColorViewModel.initalizeColors()
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
        self.favColorViewModel.onInitilizedFavColors = {

        }
    }
    
    func getSelectedColor() -> UIColor {
        return self.favColorViewModel.selectedColor
    }
    
    func getData() -> Any? {
        return self.favColorViewModel.selectedColor
    }
}


