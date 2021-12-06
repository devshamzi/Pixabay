//
//  MainCoordinator.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        navigationController.navigationBar.isHidden = true
        self.navigationController = navigationController
    }

    func goTohome() {
        let galleryVC = GalleryViewController.instantiate()
        galleryVC.coordinator = self
        navigationController.pushViewController(galleryVC, animated: true)
    }
}
