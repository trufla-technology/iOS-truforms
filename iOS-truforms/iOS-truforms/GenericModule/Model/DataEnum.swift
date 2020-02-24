//
//  DataEnum.swift
//  iOS-truforms
//
//  Created by Trufla on 2/24/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

struct DataEnum {
    // for enum
    var href: String?
    var id: String?
    var enumNames: [String]?
}

extension DataEnum: Decodable {
    enum DataEnumCodingKeys: String, CodingKey {
        case href
        case id = "enum"
        case enumNames
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataEnumCodingKeys.self)
        href = try container.decodeWrapper(key: .href, defaultValue: nil)
        id = try container.decodeWrapper(key: .id, defaultValue: nil)
        enumNames = try container.decodeWrapper(key: .enumNames, defaultValue: nil)
    }
}
