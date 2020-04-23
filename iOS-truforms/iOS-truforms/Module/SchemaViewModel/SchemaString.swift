//
//  SchemaString.swift
//  iOS-truforms
//
//  Created by Trufla on 2/11/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class SchemaString: SchemaObjectProtocol {
    var tag: String = ""
     var parentTag: String = ""
     var schemaNode: SchemaNode?

    init(schemaNode: SchemaNode) {
        self.schemaNode = schemaNode
    }
    
    var maxLength: Int {
        return schemaNode?.maxLength ?? -1
    }
    
    var minLength: Int {
        return schemaNode?.minLength ?? -1
    }
    
    var format: String {
        return schemaNode?.format ?? ""
    }
    
    var pattern: String {
        return schemaNode?.pattern ?? ""
    }
}
