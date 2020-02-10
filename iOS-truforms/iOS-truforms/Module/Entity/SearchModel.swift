//
//  SearchModel.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

struct SearchModel {
    var artistId: Int?
    var trackId: Int?
    var artistName: String?
}

extension SearchModel: Decodable {
    enum SearchModelCodingKeys: String, CodingKey {
        case artistId
        case trackId
        case artistName
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchModelCodingKeys.self)
        artistId = try container.decodeWrapper(key: .artistId, defaultValue: -1)
        trackId = try container.decodeWrapper(key: .trackId, defaultValue: -1)
        artistName = try container.decodeWrapper(key: .artistName, defaultValue: "")
    }
}

struct SearchResponse {
    var resultCount: Int?
    var results: [SearchModel]?
}

extension SearchResponse: Decodable {
    enum SearchResponseCodingKeys: String, CodingKey {
        case resultCount
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchResponseCodingKeys.self)
        resultCount = try container.decodeWrapper(key: .resultCount, defaultValue: -1)
        results = try container.decodeWrapper(key: .results, defaultValue: [])
    }
}
