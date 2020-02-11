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
    var type: String {get}
    var title: String {get}
    var description: String {get}
}


