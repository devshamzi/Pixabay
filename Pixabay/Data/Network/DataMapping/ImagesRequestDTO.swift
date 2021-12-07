//
//  ImagesRequestDTO.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import Foundation

struct ImagesRequestDTO: Codable {
    let query: String
    let page: Int
}
