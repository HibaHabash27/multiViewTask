//
//  UIView+Extension.swift
//  Hesabi
//
//  Created by Mohammad Rabi on 12/15/21.
//  Copyright © 2021 ITG. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
    
    func addInView(container: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint(item: self,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: self,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: self,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: self,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 0).isActive = true
    }
    
    func addSeparatorInView(container: UIView) {
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: container.leadingAnchor,
                                                 constant: 0),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor,
                                                constant: 0),
            self.widthAnchor.constraint(equalTo: container.widthAnchor),
            self.heightAnchor.constraint(equalToConstant: DrawingUtils.getBorderHeight())
        ])

    }
    
    func circledCorners() {
        self.layer.cornerRadius = self.frame.height / 2 //check if something here needs to be fixed 
    }
    
    func addBorder(_ width: CGFloat = DrawingUtils.getBorderHeight(), color: UIColor = UIColor.black) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    

    
    func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.2
      layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 0.5
        
      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }


    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize = CGSize(width: -1, height: 1), radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius

      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}


