//
//  SchemaEnumTarget.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 4/27/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Moya


enum SchemaEnumTarget {
    case callEnumData(model: EnumDataRequest)
}

extension SchemaEnumTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: SchemaNodeConstants.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .callEnumData(let model):
            return "\(model.path)"
        }
    }
    
    var method: Method {
        switch self {
        case .callEnumData:
            return .get
        }
    }
    
    var sampleData: Data {
        guard let data = SchemaNodeConstants.EnumsampleData.data(using: .utf8) else {
            preconditionFailure("Invalid data")
        }
        switch self {
        case .callEnumData:
            return data
        }
    }
    
    var task: Task {
        switch self {
        case .callEnumData(let model):
            return .requestParameters(parameters: [SchemaNodeConstants.params.term: "\(model)"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
