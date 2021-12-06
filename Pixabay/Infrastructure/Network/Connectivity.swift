//
//  Connectivity.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import Alamofire

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
