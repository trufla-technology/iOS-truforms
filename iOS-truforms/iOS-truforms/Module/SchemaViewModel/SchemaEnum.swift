//
//  SchemaEnum.swift
//  iOS-truforms
//
//  Created by Trufla on 2/18/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class SchemaEnum: SchemaObjectProtocol {
    var schemaNode: SchemaNode?
    var key: String?

    init(schemaNode: SchemaNode, key: String = "") {
       self.schemaNode = schemaNode
       self.key = key
    }
    
    // AnyType String, Number, Boolean
    var enumuration: [AnyType] {
        guard let enums = schemaNode?.enumuration else {
            return []
        }
        return enums
    }
    
    var enumNames: [String] {
        guard let enumNames = schemaNode?.enumNames else {
            return []
        }
        return enumNames
    }
}
