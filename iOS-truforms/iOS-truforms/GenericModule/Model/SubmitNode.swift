//
//  SubmitNode.swift
//  iOS-truforms
//
//  Created by Trufla on 4/1/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

struct SubmitNode {
    let id: String
    let key: String
    var value: String
    let isRequired: Bool
    
    init(key: String, id: String, isRequired: Bool) {
        self.id = id
        self.key = key
        self.value = ""
        self.isRequired = isRequired
    }
}

// Submit just doc not pseudocode
// Tree<SubmitNode> where SubmitNode is struct that have (id, key, value, isRequired)
// where SubmitNode id make the relation between the object and its own UI
// where SubmitNode value is the only mutable property which updated once related UI changed
// Tree<SubmitNode> have two behaviours (search and deserialize)
// search with id, then update the related value
// deserialize tree to JSON and keep in mind two important check
// the first check isRequired = true, so I can’t submit if value.isEmpty
// else if isRequired = false and value.isEmpty, then remove this (key, value) pair
