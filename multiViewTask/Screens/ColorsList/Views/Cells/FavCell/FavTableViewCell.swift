import UIKit

class FavTableViewCell: UITableViewCell, AddColorProtocol {
    func getData() -> Any? {
        return selectedColor
    }
    

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!

    lazy var favColorViewModel: FavColorViewModel = {
        let model = FavColorViewModel()
        return model
    }()
    var colors:[UIColor] = []
    var selectedColor = UIColor.clear ///

    
    static let identifier = "FavTableViewCell"
    let mySeparator = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initViewModel()
        self.initCollectionView()
        self.addSeparator()
        self.collectionViewLayout?.minimumLineSpacing = 0
        self.collectionViewLayout?.minimumInteritemSpacing = 0
    }

    private func initViewModel() {
        self.favColorViewModel.initalizeColors()
        self.colors = self.favColorViewModel.getColors()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            self.configureCollectionViewLayoutItemSize()
        
        }
    
    private func configureCollectionViewLayoutItemSize() {
            let leftInset: CGFloat = 10
            let rightInset: CGFloat = 10
            let itemWidth = self.frame.size.width - 40

            self.collectionViewLayout.sectionInset = UIEdgeInsets(
                top: -5,
                left: leftInset,
                bottom: 0, right: rightInset)
            self.collectionViewLayout.itemSize = CGSize(
                width: itemWidth,
                height: 260)
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
        return selectedColor
    }
}


