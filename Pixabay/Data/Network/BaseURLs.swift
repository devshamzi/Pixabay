//
//  BaseURLs.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import Foundation

enum BaseURL {
    case apiBaseUrl

    var url: String {
        switch self {
        case .apiBaseUrl:
            return "https://pixabay.com/api/"
        }
    }
}
