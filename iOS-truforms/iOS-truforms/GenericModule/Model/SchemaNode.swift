//
//  BaseResponse.swift
//  CleanSwift
//
//  Created by Trufla on 2/3/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

struct SchemaNode {
    var title: String?
    var description: String?
    var type: String
    var properties: [String: SchemaNode]?
    var required: [String]?
}

extension SchemaNode: Decodable {
    enum SchemaNodeCodingKeys: String, CodingKey {
        case title
        case description
        case type
        case properties
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SchemaNodeCodingKeys.self)
        title = try container.decodeWrapper(key: .title, defaultValue: "")
        description = try container.decodeWrapper(key: .description, defaultValue: "")
        type = try container.decodeWrapper(key: .type, defaultValue: "")
        properties = try container.decodeWrapper(key: .properties, defaultValue: [:])
    }
}
