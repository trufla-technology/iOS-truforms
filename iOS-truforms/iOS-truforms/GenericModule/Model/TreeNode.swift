
//
//  File.swift
//  iOS-truforms
//
//  Created by Trufla on 2/28/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

struct TreeNode<T> {
    var value: T
    var children: [TreeNode]
    
    mutating func add(node: TreeNode) {
        children.append(node)
    }
}

extension TreeNode: CustomStringConvertible {
  public var description: String {
    var s = "\(value)"
    if !children.isEmpty {
      s += children.map { $0.description }.joined(separator: ", ")
    }
    return s
  }
}

extension TreeNode
{
   func treeLines(_ nodeIndent:String="", _ childIndent:String="") -> [String]
   {
      let enumrated = children.enumerated().map{ ($0 < children.count-1, $1) }
      return [ nodeIndent + "\(value)" ] + enumrated.flatMap{ $0 ? $1.treeLines("┣╸","┃ ") : $1.treeLines("┗╸","  ") }
          .map{childIndent + $0}
   }

   func printTree() {
        print(treeLines().joined(separator:"\n"))
   }
   // traverse
   
}
