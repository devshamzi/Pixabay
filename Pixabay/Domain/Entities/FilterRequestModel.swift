//
//  FilterRequestModel.swift
//  Pixabay
//
//  Created by Shamzi on 08/12/2021.
//

import Foundation

struct FilterRequestModel {
    var searchTerm: String?
    var category: String?

    var dictionaryRepresentation: [String: String?] {

        return [
            "q" : searchTerm,
            "category" : category
        ]
    }
}
