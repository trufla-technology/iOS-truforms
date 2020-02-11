//
//  SearchTarget.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

// we will skip fetch real data for now and going to test decodable data through tdd approach
import Moya

enum SchemaNodeTarget {
    case fetch(id: String)
}

extension SchemaNodeTarget: TargetType {
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
