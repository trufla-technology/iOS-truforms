//
//  SchemaPresentationModel.swift
//  iOS-truforms
//
//  Created by Trufla on 2/17/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

struct SchemaPresentationModel {
    var title: String?
    var description: String?
    var properties: [String: SchemaObjectProtocol]?
    var required: [String]?
    var oneOf: [OneOfProperty]?
}
