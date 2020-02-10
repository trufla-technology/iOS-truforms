//
//  KeyedDecodingContainer+Extension.swift
//  CleanSwift
//
//  Created by Mustafa on 12/22/19.
//  Copyright © 2019 Andela. All rights reserved.
//
extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
