//
//  ReusableView.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
