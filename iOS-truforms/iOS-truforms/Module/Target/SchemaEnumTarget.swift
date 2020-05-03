//
//  SchemaEnumTarget.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 4/27/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Moya


enum SchemaEnumTarget {
    case fetch(id: String)
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
        case .fetch:
            return SchemaNodeConstants.endPoint
        }
    }
    
    var method: Method {
        switch self {
        case .fetch:
            return .get
        }
    }
    
    var sampleData: Data {
        guard let data = SchemaNodeConstants.sampleData.data(using: .utf8) else {
            preconditionFailure("Invalid data")
        }
        switch self {
        case .fetch:
            return data
        }
    }
    
    var task: Task {
        switch self {
        case .fetch(let id):
            return .requestParameters(parameters: [SchemaNodeConstants.params.term: "\(id)"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
