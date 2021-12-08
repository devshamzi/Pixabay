//
//  GalleryServiceUseCase.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import RxSwift

struct GalleryServiceUseCase: NetworkService {

    static let shared = GalleryServiceUseCase()
    var bag = DisposeBag()

    private init() { }

    func getImages(filter: FilterRequestModel? = nil, page: Int, pageSize: Int, completion: @escaping ([Images]) -> Void) {
        let parm = filter?.dictionaryRepresentation
        
        GalleryService.shared.fetchImages(page: page, searchTerm: "")
            .subscribe(onNext: { (result) in
                switch result {
                case .success(let value):
                    if let data = value.toDomain().hits {
                        completion(data)
                    }

                case .failure(let error):
                    guard let error = error as? CustomError else { return }
                    print(error)
                }
            })
            .disposed(by: bag)
    }

    private func convertFilterModelIntoDict(filter : FilterRequestModel) -> [String:String]{


        return [:]
    }
}
