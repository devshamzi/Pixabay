//
//  GalleryRoute.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import Foundation

enum GalleryRoute: String {
    case getPhotos = "/api/"

    var path: String {
        return AppConfiguration().apiBaseURL + self.rawValue
    }
}
