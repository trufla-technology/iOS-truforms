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
    var tag: String = ""
    var parentTag: String = ""
    
    init(schemaNode: SchemaNode) {
       self.schemaNode = schemaNode
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
