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
    var dataSource: [Images] = []
    var page = 1

    // MARK: - Functions
    func getImages()  {
        GalleryService.shared.fetchImages(page: self.page)
            .subscribe(onNext: { [weak self] (result) in
                guard let self = self else {return}
                switch result {
                case .success(let value):
                    if let data = value.toDomain().hits {
                        if self.page == 1 {
                            self.dataSource = data
                        } else {
                            self.dataSource.append(contentsOf: data)
                        }
                    }
                    self.onChange.onNext(.success)

                case .failure(let error):
                    guard let error = error as? CustomError else { return }
                    self.onChange.onNext(.failure(message: error.localizedDescription))
                }
            })
            .disposed(by: bag)
    }
}
