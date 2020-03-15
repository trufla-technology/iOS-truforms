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
    var key: String? {get set}
    func type() -> String
    func title() -> String
    func description() -> String
    func displayOrder() -> Int
}

extension SchemaObjectProtocol {
     func type() -> String {
        return schemaNode?.type ?? ""
     }
     func title() -> String {
        return schemaNode?.title ?? key?.uppercased() ?? ""
     }
     func description() -> String {
        return schemaNode?.description ?? ""
     }
     func displayOrder() -> Int {
        return schemaNode?.displayOrder ?? -1
     }
}
