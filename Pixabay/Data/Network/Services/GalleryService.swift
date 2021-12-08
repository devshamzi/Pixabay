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

    func fetchImages(page: Int,pageSize: Int? = 20, param: [String:String]? = nil) -> Observable<AFResult<ImagesResponseDTO>> {
        let apiKey = AppConfiguration().apiKey
        return request(config: ApiDataNetworkConfig(url: GalleryRoute.getPhotos.path,
                                                    headers: [:],
                                                    queryParameters: [],
                                                    isQueryStringURL: true))
    }
}
