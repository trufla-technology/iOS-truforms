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
        let formats = SchemaNodeConstants.StringFormats.self
        switch node.format {
        case formats.DATE:
            drawDate(node)
        case formats.DATETIME:
            drawDateTime(node)
        case formats.EMAIL:
            drawEmail(node)
        case formats.MAPLOCATION:
            drawMapLocation(node)
        case formats.PHONE:
            drawPhone(node)
        case formats.PHOTO:
            drawPhoto(node)
        case formats.TIME:
            drawTime(node)
        default:
            drawTextField(node)
        }
    }
    func drawTextField(_ node: SchemaString) {
        print("Text area: ", node.title())
    }
    func drawDate(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    func drawDateTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    func drawTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    func drawEmail(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    func drawPhone(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    func drawPhoto(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    func drawMapLocation(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
}
