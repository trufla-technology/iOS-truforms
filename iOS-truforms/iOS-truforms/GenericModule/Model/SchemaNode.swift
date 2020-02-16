//
//  BaseResponse.swift
//  CleanSwift
//
//  Created by Trufla on 2/3/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import ObjectMapper

struct SchemaNode: Mappable {
    var title: String?
    var description: String?
    var type: String?
    var format: String?
    var href: String?
    var properties: Dictionary<String, SchemaNode>?
    var enumuration: [String]?
    var enumNames: [String]?
    var required: [String]?
    var oneOf: [OneOfProperty]?

    // MARK: JSON
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        type <- map["type"]
        format <- map["format"]
        href <- map["href"]
        properties <- map["properties"]
        enumuration <- map["enum"]
        enumNames <- map["enumNames"]
        oneOf <- map["oneOf"]
        required <- map["required"]
    }

}
