//
//  Coordinator.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}
