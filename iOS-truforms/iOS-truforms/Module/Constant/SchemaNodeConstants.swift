//
//  SearchConstants.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

enum SchemaNodeConstants {
    static let baseUrl = "https://itunes.apple.com/"
    static let endPoint = "search"
    enum params {
        static let term = "term"
    }
    static let sampleData = """
{
    "title": "Simple",
    "description": "Simple form with input fields",
    "type": "object",
    "display_order": 0,
    "properties": {
        "first_name": {
            "type": "string",
            "display_order": 0
        },
        "last_name": {
            "type": "string",
            "display_order": 1
        },
        "email": {
            "type": "string",
            "display_order": 2
        },
        "phone_number": {
            "type": "string",
            "display_order": 3
        },
        "year": {
            "type": "number",
            "display_order": 4,
            "pattern": "[1-2][0-9]{3}"
        },
        "effective_date": {
            "type": "string",
            "display_order": 5,
            "format": "date"
        },
        "do_not_contact": {
            "type": "boolean",
            "display_order": 6
        }
    },
    "required": [
        "year",
        "effective_date"
    ]
}
"""
    enum SchemaKeywords {
        static let TYPE = "type"
        static let ENUM = "enum"
        static let FORMAT = "format"
        static let CONST = "const"
        static let PROPERTIES = "properties"
    }
    
    enum SchemaType {
        static let NUMBER = "number"
        static let STRING = "string"
        static let BOOLEAN = "boolean"
        static let OBJECT = "object"
        static let ARRAY = "array"
    }
    
    enum StringFormats {
        static let DATETIME = "datetime"
        static let PHOTO = "photo"
        static let MAPLOCATION = "map_lat_long"
        static let DATE = "date"
        static let TIME = "time"
        static let EMAIL = "email"
        static let PHONE = "tel"
    }
}

