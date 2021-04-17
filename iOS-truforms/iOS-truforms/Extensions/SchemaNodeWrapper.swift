//
//  Indirect.swift
//  iOS-truforms
//
//  Created by Trufla on 2/23/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
struct SchemaNodeWrapper<T: Decodable>: Decodable {
    private var wrapper: Wrapper
    
    init(from decoder: Decoder) throws {
        wrapper = try Wrapper(from: decoder)
    }
    
    // Class wrapper to provide the actual indirection.
    private final class Wrapper: Decodable {
        var value: T
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            value = try container.decode(T.self)
        }
    }
    
    var value: T {
        get {
            return wrapper.value
        }
    }
}
