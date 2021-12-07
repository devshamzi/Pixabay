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
}
