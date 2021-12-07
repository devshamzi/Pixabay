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
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController = navigationController
    }
}
