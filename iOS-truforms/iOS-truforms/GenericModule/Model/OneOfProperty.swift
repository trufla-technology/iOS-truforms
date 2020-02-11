//
//  OneOfProperty.swift
//  iOS-truforms
//
//  Created by Trufla on 2/11/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation


struct OneOf {
    var enumuration: [String]?
    var required: [String]?
}

extension OneOf: Decodable {
    enum OneOfCodingKeys: String, CodingKey {
        case enumuration = "enum"
        case required
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OneOfCodingKeys.self)
        enumuration = try container.decodeWrapper(key: .enumuration, defaultValue: [])
        required = try container.decodeWrapper(key: .required, defaultValue: [])
    }
}

struct OneOfProperty {
    var properties: [String: OneOf]?
}


extension OneOfProperty: Decodable {
    enum OneOfPropertyCodingKeys: String, CodingKey {
        case properties
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OneOfPropertyCodingKeys.self)
        properties = try container.decodeWrapper(key: .properties, defaultValue: [:])
    }
}
