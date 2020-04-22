//
//  EurekaManager.swift
//  iOS-truforms
//
//  Created by Trufla on 4/22/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

class EurekaManager {
    func draw(_ node: SchemaObjectProtocol) {
        if let node = node as? SchemaObject {
            drawObject(node)
        }
        if let node = node as? SchemaArray {
            drawArray(node)
        }
        if let node = node as? SchemaEnum {
            drawEnum(node)
        }
        if let node = node as? SchemaEnumData {
            drawEnumData(node)
        }
        if let node = node as? SchemaString {
            drawString(node)
        }
    }
    
    func drawObject(_ node: SchemaObject) {
        print(node.type(), ": ", node.title())
    }
    func drawArray(_ node: SchemaArray) {
        print(node.type(), ": ", node.title())
    }
    func drawEnum(_ node: SchemaEnum) {
        print(node.type(), ": ", node.title())
    }
    func drawEnumData(_ node: SchemaEnumData) {
        print(node.type(), ": ", node.title())
    }
    func drawString(_ node: SchemaString) {
        print(node.type(), ": ", node.title())
    }
    
}
