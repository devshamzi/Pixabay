//
//  GalleryViewModel.swift
//  Pixabay
//
//  Created by Shamseer Ali on 07/12/2021.
//

import Foundation
import RxSwift

class GalleryViewModel: BaseViewModel {

    // MARK: - Enums
    enum State {
        case success
        case failure(message: String)
    }

    // MARK: - Variables
    var onChange = PublishSubject<State>()
    var dataSource: [Images]?
    var filterModel = FilterRequestModel()
    var page = 1
    var perPage = 20
    var reachEnd = false

    // MARK: - Functions
    func getImages()  {
        guard (page == 1) || (reachEnd == false) else { return }
        GalleryServiceUseCase.shared.getImages(filter: self.filterModel,
                                               page: self.page, pageSize: self.perPage) { [weak self] images in
            guard let self = self else { return }
            if self.page == 1 {
                self.dataSource = images
            } else {
                self.dataSource?.append(contentsOf: images)
            }
            if images.count < self.perPage {
                self.reachEnd = true
            } else {
                self.reachEnd = false
            }
            self.onChange.onNext(.success)
        }
    }
}
