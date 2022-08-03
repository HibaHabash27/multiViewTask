import UIKit
extension String {
    enum Localizable: String {
        case ColorTableViewControllerTitle = "colorsViewController.title"
        case TitleCellLabelText = "addViewController.titleCell.title"
        case DescriptionCellLableText = "addViewController.DescriptionCell.title"
        case ColorCellLableText = "addViewController.colorCollectionCell.title"
        case AddViewControllerTitle = "addViewController.title"
        case ColorTableEmptyViewTitle = "colorTableViewController.EmptyView.title"
        case ColorTableEmptyViewMessage = "colorTableViewController.emptyView.message"
        case EditViewControllerTitle = "editViewController.title"
        case ColorInfoConfirmDeleteTitle = "colorInfo.confirmDeleteMessage.title"
        case ColorInfoConfirmDeleteMsG = "colorInfo.confirmDeleteMessage.message"
        case ColorInfoConfirmDeleteButton = "colorInfo.confirmDeleteMessage.deleteButton"
        case ColorInfoConfirmDeleteCancelButton = "colorInfo.confirmDeleteMessage.cancelButton"
        case FavColorCellAddCustomColorButtonTitle = "favColorCell.addCustomColor"
        case CustomColorViewTitleLableText = "customColor.colorPicker.titleLableText"

        var string: String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
    }
}
