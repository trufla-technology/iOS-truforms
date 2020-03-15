//
//  SchemaDate.swift
//  iOS-truforms
//
//  Created by Trufla on 2/18/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class SchemaDate: SchemaObjectProtocol {
    var schemaNode: SchemaNode?
    var key: String?

    init(schemaNode: SchemaNode, key: String = "") {
        self.schemaNode = schemaNode
        self.key = key
    }
    var format: String {
        return schemaNode?.format ?? ""
    }
}
