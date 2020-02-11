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
    \"title\": \"Multi Nested\",
    \"description\": \"Nesting can go as far as needed to achieve structure\",
    \"type\": \"object\",
    \"properties\": {
        \"employee_information\": {
            \"type\": \"object\",
            \"title\": \"Employee Information\",
            \"description\": \"Test\",
            \"properties\": {
                \"personal\": {
                    \"type\": \"object\",
                    \"title\": \"Personal Information\",
                    \"properties\": {
                        \"first_name\": {
                            \"type\": \"string\"
                        },
                        \"last_name\": {
                            \"type\": \"string\"
                        }
                    }
                },
                \"location\": {
                    \"type\": \"object\",
                    \"title\": \"Location\",
                    \"properties\": {
                        \"phone_number\": {
                            \"type\": \"string\"
                        },
                        \"email\": {
                            \"type\": \"string\"
                        }
                    }
                }
            }
        }
    }
}
"""
}

