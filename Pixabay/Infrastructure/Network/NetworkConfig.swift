//
//  NetworkConfig.swift
//  Pixabay
//
//  Created by Shamzi on 07/12/2021.
//

import Foundation

public protocol NetworkConfigurable {
    var url: String { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String?] { get }
    var isQueryStringURL: Bool { get }
}

public struct ApiDataNetworkConfig: NetworkConfigurable {
    public let url: String
    public let headers: [String: String]
    public let queryParameters: [String: String?]
    public let isQueryStringURL: Bool

    public init(url: String,
                headers: [String: String] = [:],
                queryParameters: [String: String?] = [:],
                isQueryStringURL: Bool) {
        self.url = url
        self.headers = headers
        self.queryParameters = queryParameters
        self.isQueryStringURL = isQueryStringURL
    }
}
