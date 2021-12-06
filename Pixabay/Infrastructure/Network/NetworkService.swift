//
//  NetworkService.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import Foundation
import Alamofire
import RxSwift

typealias AFResult<T> = Result<T, Error>

protocol Wrapable {}

extension Wrapable {

    func request<T: Codable>(url: String, param: [String:Any?]? = nil, method: HTTPMethod = .post, encoding: ParameterEncoding = JSONEncoding.default) -> Observable<AFResult<T>> {
        let observer = PublishSubject<AFResult<T>>()
        if Connectivity.isConnectedToInternet {
            AF.request(url, method: method, parameters: param == nil ? nil: param! as Parameters , encoding: encoding, headers: nil).responseData{  response in
                print("--------------------------")
                debugPrint(response)
                print("--------------------------")
                let resData = response.data
                let statusCode = response.response?.statusCode ?? 0
                switch statusCode{
                case 200:
                    do {
                        guard let data = resData else{return}
                        let value = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(AFResult.success(value))
                    } catch {
                        print(error.localizedDescription)
                        observer.onNext(AFResult.failure(CustomError.failure(message: "Failed Serialize") as Error))
                    }
                    break
                default:
                    break
                }
                observer.onCompleted()
            }
            return observer
        } else {
            observer.onNext(AFResult.failure(CustomError.failure(message: "No internet connection") as Error))
            return observer
        }
    }

}
