//
//  SchemaObject.swift
//  iOS-truforms
//
//  Created by Trufla on 4/21/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
class SchemaObject: SchemaObjectProtocol {
    var schemaNode: SchemaNode?
    var key: String?

    init(schemaNode: SchemaNode, key: String = "") {
       self.schemaNode = schemaNode
       self.key = key
    }
    
    var required: [String] {
        guard let required = schemaNode?.required else {
            return []
        }
        return required
    }
}
