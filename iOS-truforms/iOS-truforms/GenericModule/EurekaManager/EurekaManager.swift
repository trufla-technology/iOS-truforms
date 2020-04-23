//
//  EurekaManager.swift
//  iOS-truforms
//
//  Created by Trufla on 4/22/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation

protocol EurekaManagerDelegate: class {
    // back to write something here
    func addText(title:String, placeHolder:String, _ sectionTag: String)
    
    func addEmailText(title:String, placeHolder:String, _ sectionTag: String)
    
    func addPhoneText(title:String, placeHolder:String, _ sectionTag: String)
    
    func addDate(title:String, _ sectionTag: String)
    
    func addPicker(title:String, _ sectionTag: String)
    
    func addImagePicker(title:String, _ sectionTag: String)
    
    func addSection(title:String, _ sectionTag: String, _ parentTag: String)
}

class EurekaManager {
    weak var delegate:EurekaManagerDelegate!
    
    func draw(_ node: SchemaObjectProtocol, _ sectionTag: String = "") {
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
        delegate.addSection(title: node.title(), node.tag, node.parentTag)
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
        delegate.addText(title: node.title(), placeHolder: node.title(), node.parentTag)
    }
    private func drawDate(_ node: SchemaString) {
        delegate.addDate(title: node.title(), node.parentTag)
    }
    private func drawDateTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
    private func drawEmail(_ node: SchemaString) {
        delegate.addEmailText(title: node.title(), placeHolder: node.title(), node.parentTag)
    }
    private func drawPhone(_ node: SchemaString) {
        delegate.addPhoneText(title: node.title(), placeHolder: node.title(), node.parentTag)
    }
    private func drawPhoto(_ node: SchemaString) {
        delegate.addImagePicker(title: node.title(), node.parentTag)
    }
    private func drawMapLocation(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
}
