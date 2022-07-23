//
//  UIStoryboard+Extension.swift
//  Hesabi
//
//  Created by Mohammad Rabi on 12/16/21.
//  Copyright © 2021 ITG. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    
    /**  Add new storyboard name here  case Main, Login , Profile  */

    case Main
    case AddColor

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue,
                            bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type,
                                              function: String = #function,
                                              line: Int = #line,
                                              file: String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(
            withIdentifier: storyboardID) as? T else {
                fatalError("""
                ViewController with identifier \(
                storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(
                file) \nLine Number : \(line) \nFunction : \(function)
                """)
            }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    /** Not using static as it wont be possible to override to provide custom storyboardID then */
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
