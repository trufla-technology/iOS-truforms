//
//  SchemaViewModel.swift
//  iOS-truforms
//
//  Created by Trufla on 2/11/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

protocol SchemaObjectProtocol {
    var schemaNode: SchemaNode? {set get}
    var tag: String {set get}
    var parentTag: String {set get}
    func key() -> String 
    func type() -> String
    func title() -> String
    func description() -> String
    func displayOrder() -> Int
}

extension SchemaObjectProtocol {
     func type() -> String {
        return schemaNode?.type ?? ""
     }
     func key() -> String {
        return schemaNode?.key ?? ""
     }
     func title() -> String {
        return schemaNode?.title ?? key().uppercased()
     }
     func description() -> String {
        return schemaNode?.description ?? ""
     }
     func displayOrder() -> Int {
        return schemaNode?.displayOrder ?? -1
     }
}
