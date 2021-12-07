//
//  UIColletionView+Extension.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_ type: T.Type) where T: ReusableView {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)

        self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(
        _ type: T.Type,
        for indexPath: IndexPath
    ) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(
                withReuseIdentifier: T.reuseIdentifier,
                for: indexPath
        ) as? T else {
            fatalError("dequeueReusableCell Force Casting")
        }
        return cell
    }
}
