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
    var displayOrder: Int?
    var format: String?
    var href: String?
    var properties: [String: SchemaNode]?
    var enumuration: [String]?
    var enumNames: [String]?
    var required: [String]?
    var oneOf: [OneOfProperty]?
}

extension SchemaNode: Decodable {
    enum SchemaNodeCodingKeys: String, CodingKey {
        case title
        case description
        case type
        case displayOrder = "display_order"
        case format
        case href
        case enumuration = "enum"
        case enumNames
        case properties
        case required
        case oneOf
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SchemaNodeCodingKeys.self)
        title = try container.decodeWrapper(key: .title, defaultValue: "")
        description = try container.decodeWrapper(key: .description, defaultValue: "")
        type = try container.decodeWrapper(key: .type, defaultValue: "")
        displayOrder = try container.decodeWrapper(key: .displayOrder, defaultValue: -1)
        format = try container.decodeWrapper(key: .format, defaultValue: "")
        href = try container.decodeWrapper(key: .href, defaultValue: "")
        properties = try container.decodeWrapper(key: .properties, defaultValue: [:])
        enumuration = try container.decodeWrapper(key: .enumuration, defaultValue: [])
        enumNames = try container.decodeWrapper(key: .enumNames, defaultValue: [])
        required = try container.decodeWrapper(key: .required, defaultValue: [])
        oneOf = try container.decodeWrapper(key: .oneOf, defaultValue: [])
    }
}
