//
//  SchemaArray.swift
//  iOS-truforms
//
//  Created by Trufla on 4/7/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
class SchemaArray: SchemaObjectProtocol {
    var schemaNode: SchemaNode?
    var key: String?
    
    init(schemaNode: SchemaNode, key: String = "") {
       self.schemaNode = schemaNode
       self.key = key
    }
    
    var maxItem: Int {
        return schemaNode?.maxItems ?? 0
    }
    
    var minItem: Int {
        return schemaNode?.minItems ?? 0
    }
    
    var uniqueItems: Bool {
        return schemaNode?.uniqueItems ?? false
    }
}
