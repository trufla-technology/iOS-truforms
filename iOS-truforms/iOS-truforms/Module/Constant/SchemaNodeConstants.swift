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
    \"title\": \"Multiple Conditional Control\",
    \"description\": \"Add multiple conditional controls\",
    \"type\": \"object\",
    \"display_order\": 0,
    \"properties\": {
        \"food_like\": {
            \"type\": \"string\",
            \"display_order\": 0,
            \"enum\": [
                \"Hot Dog\",
                \"Pizza\",
                \"Hamburger\"
            ]
        },
        \"pizza_type\": {
            \"type\": \"string\",
            \"display_order\": 1,
            \"enum\": [
                \"Marinara\",
                \"Margherita\",
                \"Vegetarian\"
            ]
        },
        \"hamburger_meat\": {
            \"type\": \"string\",
            \"display_order\": 2,
            \"enum\": [
                \"Chicken\",
                \"Beef\",
                \"Lamb\",
                \"Vegetarian\"
            ]
        },
        \"vegetable_choice\": {
            \"type\": \"string\",
            \"display_order\": 3,
            \"enum\": [
                \"yes\",
                \"no\"
            ],
            \"enumNames\": [
                \"Yes\",
                \"No\"
            ],
            \"format\": \"radiogroup\"
        },
        \"vegetables\": {
            \"type\": \"string\",
            \"display_order\": 4,
            \"enum\": [
                \"Mushrooms\",
                \"Tomatoes\",
                \"Lettuce\"
            ]
        }
    },
    \"required\": [
        \"food_like\",
        \"vegetable_choice\"
    ],
    \"oneOf\": [
        {
            \"properties\": {
                \"food_like\": {
                    \"enum\": [
                        \"Pizza\"
                    ],
                    \"required\": [
                        \"pizza_type\"
                    ]
                }
            }
        },
        {
            \"properties\": {
                \"food_like\": {
                    \"enum\": [
                        \"Hamburger\"
                    ],
                    \"required\": [
                        \"hamburger_meat\"
                    ]
                }
            }
        },
        {
            \"properties\": {
                \"vegetable_choice\": {
                    \"enum\": [
                        \"yes\"
                    ],
                    \"required\": [
                        \"vegetables\"
                    ]
                }
            }
        }
    ]
}
"""
}

