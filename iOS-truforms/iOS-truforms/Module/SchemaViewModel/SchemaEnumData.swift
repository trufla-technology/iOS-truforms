//
//  SchemaEnumData.swift
//  iOS-truforms
//
//  Created by Trufla on 4/12/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class SchemaEnumData: SchemaObjectProtocol {
    var schemaNode: SchemaNode?
    var tag: String = ""
    var parentTag: String = ""
    
    init(schemaNode: SchemaNode, key: String = "") {
       self.schemaNode = schemaNode
    }
    
    var data: DataEnum? {
        guard let data = schemaNode?.enumData else {
            return nil
        }
        return data
    }
    
    var href: String {
        guard let href = data?.href else {
            return ""
        }
        return href
    }

    var id: String {
        guard let id = data?.id else {
            return ""
        }
        return id
    }

    var enumNames: [String] {
        guard let enumNames = data?.enumNames else {
            return []
        }
        return enumNames
    }
}
