//
//  SchemaPhoto.swift
//  iOS-truforms
//
//  Created by Trufla on 2/18/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class SchemaPhoto: SchemaObjectProtocol {
    var schemaNode: SchemaNode?

    init(schemaNode: SchemaNode) {
       self.schemaNode = schemaNode
    }
    
    var format: String {
       return schemaNode?.format ?? ""
    }
}
