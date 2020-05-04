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
    func callEnumData(model: EnumDataRequest)
}

class EnumDataInteractor: BaseInteractor<SchemaEnumTarget, SchemaNode> {
    var presenter: EnumDataPresenterProtocol?

    /*
    private func createUrl() {
        var urlIncludes :[String] = []
        
        var fullUrl:String = ""
        
        for name in names {
            if name.contains("."){
                let parts = name.split(separator: ".")
                urlIncludes.append(String(parts[0]))
            }
        }
        
        if (urlIncludes.count != 0) {
            fullUrl.append("?includes=")
            for include in urlIncludes{
                fullUrl.append(include + ",")
            }
        }
        
        switch self.path {
        case "/vehicles","/properties":
         
            if fullUrl.contains("?includes="){
                fullUrl += "location.policy&location.policy.policy_expiration_date=gteq::" + getCurrentDate() + "&location.policy.cycle_business_purpose=!eq::XLN"
            }else {
                fullUrl += "?includes=location.policy&location.policy.policy_expiration_date=gteq::" + getCurrentDate() + "&location.policy.cycle_business_purpose=!eq::XLN"
            }
            
            case "/policies":
             fullUrl += "?policy_expiration_date=gteq::" + getCurrentDate()  + "&cycle_business_purpose=!eq::XLN"
        default:
             print("")
        }
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let result = dateFormatter.string(from: Date())
        return result
    }
 */
}

extension EnumDataInteractor: EnumDataInteractorProtocol {
    func callEnumData(model: EnumDataRequest) {
        request(targetType: .callEnumData(model: model)) { response in
           self.presenter?.present()
           print(response)
        }
    }
}
