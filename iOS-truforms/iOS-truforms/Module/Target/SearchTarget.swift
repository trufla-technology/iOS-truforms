//
//  SearchTarget.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

// we will skip fetch real data for now and going to test decodable data through tdd approach
import Moya

enum SearchTarget {
    case search(keywords: String)
}

extension SearchTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: SearchConstants.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return SearchConstants.endPoint
        }
    }
    
    var method: Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var sampleData: Data {
        guard let data = SearchConstants.sampleData.data(using: .utf8) else {
            preconditionFailure("Invalid data")
        }
        switch self {
        case .search:
            return data
        }
    }
    
    var task: Task {
        switch self {
        case .search(let keywords):
            return .requestParameters(parameters: [SearchConstants.params.term: "\(keywords)"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
