//
//  UIViewController+Extension.swift
//  Hesabi
//
//  Created by Mohammad Rabi on 12/24/21.
//  Copyright © 2021 ITG. All rights reserved.
//

import UIKit
extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
