//
//  EnumDataFetcher.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 4/26/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
struct EnumDataRequest {
    let path: String
    let date: String
    let names: [String]
}

protocol EnumDataInteractorProtocol {
    func callEnumData(model: EnumDataRequest,data: @escaping ([String]) -> Void)
}

class EnumDataInteractor: BaseInteractor<SchemaEnumTarget, SchemaNode> , EnumDataInteractorProtocol{
    var presenter: EnumDataPresenterProtocol?
    
    func callEnumData(model: EnumDataRequest, data: @escaping ([String]) -> Void) {
        requestEnumData(targetType: .callEnumData(model: model)) { response in
            if let x : [String] = response as? [String]{
                data(x)
            }
            
            if let dic:[String : Any] = response as? [String:Any] {
                var dataArr = [String]()
                for (key, value) in dic {
                    print(key, value)
                    let resultString = String(describing: value)

                    dataArr.append(resultString)
                }
                data(dataArr)
            }
            
            self.presenter?.present()
        }
    }
    
    func betterPrintGenericInfo<T>(_ value: T) {
        let t = type(of: value as Any)
        let resultString = String(describing: value)

        print("'\(resultString)' of type '\(t)'")
    }
    
    func printInfo(_ value: Any) {
        let t = type(of: value)
        print("'\(value)' of type '\(t)'")
    }
}


