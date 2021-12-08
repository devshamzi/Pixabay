//
//  DetailImageViewController.swift
//  Pixabay
//
//  Created by Shamzi on 08/12/2021.
//

import UIKit
import SDWebImage

class DetailImageViewController: BaseViewController {

    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        }
    }
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!


    // MARK: - Variables
    var viewModel = DetailImageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setImageDeatils()
    }


    private func setImageDeatils() {
        DispatchQueue.main.async {
            guard let imageUrl = self.viewModel.dataSource?.largeImageURL else { return }
            guard let userImageUrl = self.viewModel.dataSource?.userImageURL else { return }
            self.imageView.sd_setImage(with: URL(string: (imageUrl)), placeholderImage: UIImage(named: "placeholder.png"))
            self.profileImage.sd_setImage(with: URL(string: (userImageUrl)), placeholderImage: UIImage(named: "placeholder.png"))
            self.userNameLabel.text = self.viewModel.dataSource?.user
        }

    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
