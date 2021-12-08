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
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!

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

            self.likeLabel.text = "\(self.viewModel.dataSource?.likes ?? 0)"
            self.commentLabel.text = "\(self.viewModel.dataSource?.comments ?? 0)"
            self.downloadLabel.text = "\(self.viewModel.dataSource?.downloads ?? 0)"
            self.viewLabel.text = "\(self.viewModel.dataSource?.views ?? 0)"

        }

    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
