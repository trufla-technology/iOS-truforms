//
//  NetworkLayer.swift
//  CleanSwift
//
//  Created by Trufla on 1/31/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import Moya
import ObjectMapper

class BaseInteractor<MoyaTarget: TargetType, T: Mappable> {
    var basePresenter: BasePresenterProtocol?
    let provider = MoyaProvider<MoyaTarget>(stubClosure: MoyaProvider.immediatelyStub)
}

extension BaseInteractor {
    func request(targetType: MoyaTarget, completion: @escaping (T) -> Void) {
        provider.request(targetType) { result in
            switch(result) {
            case .success(let response):
                do {
                    let decodableResponse = try response.mapObject(T.self)
                    completion(decodableResponse)
                } catch {
                    self.basePresenter?.present(error: error.localizedDescription)
                }
            case .failure(let error):
                self.basePresenter?.present(error: error.localizedDescription)
            }
        }
    }
}
