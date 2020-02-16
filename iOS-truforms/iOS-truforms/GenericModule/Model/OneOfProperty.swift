//
//  OneOfProperty.swift
//  iOS-truforms
//
//  Created by Trufla on 2/11/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import ObjectMapper

struct OneOf: Mappable {
    var enumuration: [String]?
    var required: [String]?
    
    // MARK: JSON
    init?(map: Map) {}

    mutating func mapping(map: Map) {
      enumuration <- map["enum"]
      required <- map["required"]
    }
}


struct OneOfProperty: Mappable {
    var properties: Dictionary<String, OneOf>?
    // MARK: JSON
    init?(map: Map) { }

    mutating func mapping(map: Map) {
      properties <- map["properties"]
    }
}
