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
    var tag: String = ""
    var parentTag: String = ""
    init(schemaNode: SchemaNode) {
        self.schemaNode = schemaNode
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
    
    
    func itemsToDisplay() ->[Any] {
        if(!enumNames.isEmpty){
            return enumNames
        }
        var array:[Any] = []
        for name in enumuration {
            switch name {
            case let .int(property):
                array.append(property.value ?? 1)
            case let .string(property):
                array.append(property.value ?? "")
            case let .bool(property):
                array.append(property.value ?? false)
            }
        }
        return array
    }
}
