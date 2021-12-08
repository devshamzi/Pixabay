//
//  GalleryCoordinator.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import Foundation

extension MainCoordinator {

    func goTohome() {
        let galleryVC = GalleryViewController.instantiate()
        galleryVC.coordinator = self
        navigationController.pushViewController(galleryVC, animated: true)
    }

    func presentImageDetail(model: ImageModel) {
        let detailVC = DetailImageViewController.instantiate()
        detailVC.coordinator = self
        detailVC.viewModel.dataSource = model
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        navigationController.present(detailVC, animated: true, completion: nil)
    }
}
