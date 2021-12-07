//
//  GalleryCollectionViewCell.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit
import SDWebImage

class GalleryCollectionViewCell: UICollectionViewCell, ReusableView {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFill
        }
    }

    var model: Images? {
        didSet{
            config()
        }
    }

    private func config() {
        imageView.sd_setImage(with: URL(string: (model?.previewURL)!), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
