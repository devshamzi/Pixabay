//
//  UIViewController+Extension.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit

extension UIViewController {

    static func instantiate() -> Self {
        let viewControllerName = String(describing: self)
        let viewController = self.init(nibName: viewControllerName, bundle: nil)
        return viewController
    }
}
