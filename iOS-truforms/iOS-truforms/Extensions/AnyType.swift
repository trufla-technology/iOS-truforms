//
//  AnyType.swift
//  iOS-truforms
//
//  Created by Trufla on 2/23/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

enum AnyType: Decodable {

    case int(EnumStoredProperty<Int>), string(EnumStoredProperty<String>), bool(EnumStoredProperty<Bool>)

    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(EnumStoredProperty(value: int))
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(EnumStoredProperty(value: string))
            return
        }
        if let bool = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(EnumStoredProperty(value: bool))
            return
        }
        throw AnyTypeError.missingValue
    }
    enum AnyTypeError:Error {
        case missingValue
    }
}

class EnumStoredProperty<T> {
  var value: T?
  init(value: T? = nil) {
      self.value = value
  }
}
