//
//  SchemaString.swift
//  iOS-truforms
//
//  Created by Trufla on 2/11/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class SchemaString: SchemaObjectProtocol {
    var schemaNode: SchemaNode?
    var key: String?

    init(schemaNode: SchemaNode, key: String = "") {
        self.schemaNode = schemaNode
        self.key = key
    }
    var type: String {
        return schemaNode?.type ?? ""
    }
    var title: String {
        return schemaNode?.title ?? ""
    }
    var description: String {
        return schemaNode?.description ?? ""
    }
    var displayOrder: Int {
        return schemaNode?.displayOrder ?? -1
    }
}
