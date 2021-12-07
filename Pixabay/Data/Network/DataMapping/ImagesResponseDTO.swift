//
//  ImagesResponseDTO.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import Foundation

// MARK: - Data Transfer Object
struct ImagesResponseDTO: Codable {
    private enum CodingKeys: String, CodingKey {
        case total
        case totalHits
        case data = "hits"
    }
    let total: Int
    let totalHits: Int
    let data: [HitsDTO]
}

extension ImagesResponseDTO {
    struct HitsDTO: Codable {
        private enum CodingKeys: String, CodingKey {
            case id
            case pageURL
            case type
            case tags
            case previewURL
            case previewWidth
            case previewHeight
            case webformatURL
            case webformatWidth
            case webformatHeight
            case largeImageURL
            case imageWidth
            case imageHeight
            case imageSize
            case views
            case downloads
            case collections
            case likes
            case comments
            case user_id
            case user
            case userImageURL
        }

        let id: Int
        let pageURL: String?
        let type: String?
        let tags: String?
        let previewURL: String?
        let previewWidth: Int?
        let previewHeight: Int?
        let webformatURL: String?
        let webformatWidth: Int?
        let webformatHeight: Int?
        let largeImageURL: String?
        let imageWidth: Int?
        let imageHeight: Int?
        let imageSize: Int?
        let views: Int?
        let downloads: Int?
        let collections: Int?
        let likes: Int?
        let comments: Int?
        let user_id: Int?
        let user: String?
        let userImageURL: String?
    }
}

extension ImagesResponseDTO {
    func toDomain() -> ImagePage {
        return .init(total: total,
                     totalHits: totalHits,
                     hits: data.map { $0.toDomain() })
    }
}


extension ImagesResponseDTO.HitsDTO {
    func toDomain() -> Images {
        return .init(id: id,
                     pageURL: pageURL,
                     type: type,
                     tags: tags,
                     previewURL: previewURL,
                     previewWidth: previewWidth,
                     previewHeight: previewHeight,
                     webformatURL: webformatURL,
                     webformatWidth: webformatWidth,
                     webformatHeight: webformatHeight,
                     largeImageURL: largeImageURL,
                     imageWidth: imageWidth,
                     imageHeight: imageHeight,
                     imageSize: imageSize,
                     views: views,
                     downloads: downloads,
                     collections: collections,
                     likes: likes,
                     comments: comments,
                     user_id: user_id,
                     user: user,
                     userImageURL: userImageURL)
    }
}

