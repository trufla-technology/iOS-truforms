//
//  Responsable.swift
//  CleanSwift
//
//  Created by Mustafa on 12/22/19.
//  Copyright © 2019 Andela. All rights reserved.
//
import Foundation

protocol Responsable {
    associatedtype T
    func map(_ data: Data, completion: @escaping (Result<T, Error>) -> Void)
}

extension Responsable where T: Decodable {
    func map(_ data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let decodableResponse = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodableResponse))
        } catch {
            completion(.failure(error))
        }
    }
}
