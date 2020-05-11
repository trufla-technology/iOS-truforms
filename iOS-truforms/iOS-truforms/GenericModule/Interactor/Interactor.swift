//
//  NetworkLayer.swift
//  CleanSwift
//
//  Created by Trufla on 1/31/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
import Moya

class BaseInteractor<MoyaTarget: TargetType, T: Decodable> {
    var basePresenter: BasePresenterProtocol?
    let provider = MoyaProvider<MoyaTarget>(stubClosure: MoyaProvider.immediatelyStub)
}

extension BaseInteractor {
    func request(targetType: MoyaTarget, completion: @escaping (T) -> Void) {
        provider.request(targetType) { result in
            switch(result) {
            case .success(let response):
                do {
                    let decodableResponse = try response.map(T.self)
                    completion(decodableResponse)
                } catch {
                    self.basePresenter?.present(error: error.localizedDescription)
                }
            case .failure(let error):
                self.basePresenter?.present(error: error.localizedDescription)
            }
        }
    }
    
    
    func requestEnumData(targetType: MoyaTarget, completion: @escaping (Any) -> Void) {
        provider.request(targetType) { result in
            switch(result) {
            case .success(let response):
                do {
//                    guard let myJson:[String:Any] = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] else {return}
//                    for (key, value) in myJson {
//                        print(key, value)
//
//                    }
//                    let decodableResponse = try response.map(T.self)
                    completion(try response.mapJSON())
                } catch {
                    self.basePresenter?.present(error: error.localizedDescription)
                }
            case .failure(let error):
                self.basePresenter?.present(error: error.localizedDescription)
            }
        }
    }
}
