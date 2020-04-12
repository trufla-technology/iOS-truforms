//
//  BaseResponse.swift
//  CleanSwift
//
//  Created by Trufla on 2/3/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

struct SchemaNode{
    var title: String?
    var description: String?
    var type: String
    var displayOrder: Int?
    var format: String?
    var pattern: String?
    // for object
    var properties: [String: SchemaNode]?
    var required: [String]?
    // for enum
    var enumData: DataEnum?
    var enumuration: [AnyType]?
    var enumNames: [String]?
    // for one Of
    var oneOf: [OneOfProperty]?
    // for array
    var items: SchemaNodeWrapper<SchemaNode>?
    var maxItems: Int?
    var minItems: Int?
    var uniqueItems: Bool?
    // for string
    var maxLength: Int?
    var minLength: Int?
}


extension SchemaNode: Decodable {
    enum SchemaNodeCodingKeys: String, CodingKey {
        case title
        case description
        case type
        case displayOrder = "display_order"
        case format
        case pattern
        // for object
        case properties
        case required
        // for enum
        case enumuration = "enum"
        case enumNames
        // for enum data
        case enumData = "_data"
        // for one Of
        case oneOf
        // for array
        case items
        case maxItems
        case minItems
        case uniqueItems
        // for string
        case maxLength
        case minLength
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SchemaNodeCodingKeys.self)
        title = try container.decodeWrapper(key: .title, defaultValue: nil)
        description = try container.decodeWrapper(key: .description, defaultValue: nil)
        type = try container.decodeWrapper(key: .type, defaultValue: "")
        displayOrder = try container.decodeWrapper(key: .displayOrder, defaultValue: nil)
        format = try container.decodeWrapper(key: .format, defaultValue: nil)
        pattern = try container.decodeWrapper(key: .pattern, defaultValue: nil)
        enumData = try container.decodeWrapper(key: .enumData, defaultValue: nil)
        properties = try container.decodeWrapper(key: .properties, defaultValue: nil)
        enumuration = try container.decodeWrapper(key: .enumuration, defaultValue: nil)
        enumNames = try container.decodeWrapper(key: .enumNames, defaultValue: nil)
        required = try container.decodeWrapper(key: .required, defaultValue: nil)
        oneOf = try container.decodeWrapper(key: .oneOf, defaultValue: nil)
        items = try container.decodeWrapper(key: .items, defaultValue: nil)
        maxItems = try container.decodeWrapper(key: .maxItems, defaultValue: nil)
        minItems = try container.decodeWrapper(key: .minItems, defaultValue: nil)
        uniqueItems = try container.decodeWrapper(key: .uniqueItems, defaultValue: nil)
        maxLength = try container.decodeWrapper(key: .maxLength, defaultValue: nil)
        minLength = try container.decodeWrapper(key: .minLength, defaultValue: nil)
    }
    
}

extension SchemaNode: Comparable {
    static func == (lhs: SchemaNode, rhs: SchemaNode) -> Bool {
        lhs.displayOrder == rhs.displayOrder
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.displayOrder! < rhs.displayOrder!
    }
}
