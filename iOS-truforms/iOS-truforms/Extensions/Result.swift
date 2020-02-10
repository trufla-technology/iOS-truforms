//
//  Result.swift
//  CleanSwift
//
//  Created by Mustafa on 12/22/19.
//  Copyright © 2019 Andela. All rights reserved.
//
enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
