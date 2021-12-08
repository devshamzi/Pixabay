//
//  Categories.swift
//  Pixabay
//
//  Created by Shamzi on 08/12/2021.
//

import Foundation

enum Categories: Int {
    case all = 0
    case nature = 1
    case science = 2
    case travel = 3

    var description: String? {
        switch self {
        case .all:
            return nil
        case .nature:
            return "nature"
        case .science:
            return "science"
        case .travel:
            return "travel"
        }
    }
}
