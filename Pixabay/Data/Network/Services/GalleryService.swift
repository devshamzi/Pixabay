//
//  GalleryService.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import RxSwift

struct GalleryService: NetworkService {

    static let shared = GalleryService()

    private init() { }

    func fetchImages(page: Int,pageSize: Int? = 20, param: [String:String?]) -> Observable<AFResult<ImagesResponseDTO>> {
        var parmeter = param.compactMapValues { $0 }
        parmeter["key"] = AppConfiguration().apiKey
        parmeter["page"] = "\(page)"
        parmeter["per_page"] = "\(pageSize!)"
        return request(config: ApiDataNetworkConfig(url: GalleryRoute.getPhotos.path,
                                                    headers: [:],
                                                    queryParameters: parmeter,
                                                    isQueryStringURL: true))
    }
}
