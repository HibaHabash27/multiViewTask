import UIKit
extension FavTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colors = self.favColorViewModel.colors
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavColorCell.identifier, for: indexPath) as! FavColorCell
        cell.setColor(color: colors[indexPath.row])
        if colors[indexPath.row] == self.favColorViewModel.colorOldValue {
            cell.highlight()
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            self.favColorViewModel.selectedColor = colors[indexPath.item]
            self.sendSelectedColorDelegate?.sendcolor(colorValue: self.favColorViewModel.selectedColor)
            self.validateInputDelegate?.validateInput(isValid: true, inputType: .FavCell)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colors = self.favColorViewModel.colors
        self.favColorViewModel.selectedColor = colors[indexPath.item]
        self.sendSelectedColorDelegate?.sendcolor(colorValue: self.favColorViewModel.selectedColor)
        self.validateInputDelegate?.validateInput(isValid: true, inputType: .FavCell)
        if let cell = colorsCollectionView.cellForItem(at: indexPath) as? FavColorCell {
            UIView.animate(withDuration: 0.2, animations: {
                cell.highlight()
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = colorsCollectionView.cellForItem(at: indexPath) as? FavColorCell {
            UIView.animate(withDuration: 0.2, animations: {
                cell.unhighlight()
            })
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let colors = self.favColorViewModel.colors
         return colors.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = colorsCollectionView.cellForItem(at: indexPath) as? FavColorCell {
            UIView.animate(withDuration: 0.2, animations: {
                cell.unhighlight()
            })
        }}
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = colorsCollectionView.cellForItem(at: indexPath) as? FavColorCell {
            UIView.animate(withDuration: 0.2, animations: {
                cell.highlight()
            })
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        true
    }
}

extension FavTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
