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

    func fetchImages(page: Int) -> Observable<AFResult<ImagesResponseDTO>> {
        let apiKey = AppConfiguration().apiKey
        return request(config: ApiDataNetworkConfig(url: GalleryRoute.getPhotos.path,
                                                    headers: [:],
                                                    queryParameters: ["key": apiKey,
                                                                      "page":"\(page)"],
                                                    isQueryStringURL: true))
    }
}
