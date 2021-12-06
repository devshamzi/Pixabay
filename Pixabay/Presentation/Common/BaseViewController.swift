//
//  BaseViewController.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    var bag = DisposeBag()

}
