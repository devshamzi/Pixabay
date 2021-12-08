//
//  DetailImageViewController.swift
//  Pixabay
//
//  Created by Shamzi on 08/12/2021.
//

import UIKit
import SDWebImage

class DetailImageViewController: BaseViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Variables
    var viewModel = DetailImageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setImageDeatils()
    }


    private func setImageDeatils() {
        DispatchQueue.main.async {
            guard let imageUrl = self.viewModel.dataSource?.largeImageURL else { return }
            self.imageView.sd_setImage(with: URL(string: (imageUrl)), placeholderImage: UIImage(named: "placeholder.png"))
        }

    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
