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
    private func drawObject(_ node: SchemaObject) {
        print(node.type(), ": ", node.title())
    }
    private func drawArray(_ node: SchemaArray) {
        print(node.type(), ": ", node.title())
    }
    private func drawEnum(_ node: SchemaEnum) {
        print(node.type(), ": ", node.title())
    }
    private func drawEnumData(_ node: SchemaEnumData) {
        print(node.type(), ": ", node.title())
    }
    private func drawString(_ node: SchemaString) {
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
    private func drawTextField(_ node: SchemaString) {
        print("Text area: ", node.title())
    }
    private func drawDate(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawDateTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawEmail(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawPhone(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawPhoto(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawMapLocation(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
}
