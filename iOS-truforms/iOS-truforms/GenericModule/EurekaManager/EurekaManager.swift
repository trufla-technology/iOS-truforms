//
//  EurekaManager.swift
//  iOS-truforms
//
//  Created by Trufla on 4/22/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
import Eureka
import ImageRow

protocol EurekaManagerDelegate: class {
    // back to write something here
    
    func addSection(title:String, with tag: String, at parentTag: String, ignoreTitle: Bool)
    
    func addRow <R:BaseRow> (_ row:R, at tag: String)
    
    func insertSection()
}

class EurekaManager {
    weak var delegate:EurekaManagerDelegate!
    var ignoreTitle: Bool = true
    
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
        delegate.addSection(title: node.title(), with: node.tag, at: node.parentTag, ignoreTitle: ignoreTitle)
        ignoreTitle = false
    }
    private func drawArray(_ node: SchemaArray) {
        delegate.insertSection()
//        drawObject(objprotocol)
    }
    private func drawEnum(_ node: SchemaEnum) {
        let items = node.itemsToDisplay()
        print(items)
        if items is [String] {
            let pickerInputRow = PickerInputRow<String>()
            pickerInputRow.title = node.title()
            pickerInputRow.options = items as! [String]
            delegate.addRow(pickerInputRow, at: node.parentTag)
        }
        
        if items is [Int] {
            let pickerInputRow = PickerInputRow<Int>()
            pickerInputRow.title = node.title()
            pickerInputRow.options = items as! [Int]
            delegate.addRow(pickerInputRow, at: node.parentTag)
        }
    }
    private func drawEnumData(_ node: SchemaEnumData) {
        
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
        //        print("Text area: ", node.title())
        let textRow = TextRow()
        textRow.title = node.title()
        textRow.placeholder = node.title()
        
        delegate.addRow(textRow, at: node.parentTag)
    }
    private func drawDate(_ node: SchemaString) {
        let dateRow = DateRow()
        
        dateRow.title = node.title()
        dateRow.value = Date(timeIntervalSinceReferenceDate: 0)
        
        delegate.addRow(dateRow, at: node.parentTag)
    }
    private func drawDateTime(_ node: SchemaString) {
        let dateTimeRow = DateTimeRow()
        dateTimeRow.title = node.title()
        
        delegate.addRow(dateTimeRow, at: node.parentTag)
    }
    private func drawTime(_ node: SchemaString) {
        let timeRow = TimeRow()
        timeRow.title = node.title()
        
        delegate.addRow(timeRow, at: node.parentTag)
    }
    private func drawEmail(_ node: SchemaString) {
        let emailRow = EmailRow()
        emailRow.title = node.title()
        emailRow.placeholder = node.title()
        delegate.addRow(emailRow, at: node.parentTag)
    }
    private func drawPhone(_ node: SchemaString) {
        let phoneRow = PhoneRow()
        phoneRow.title = node.title()
        phoneRow.placeholder = node.title()
        delegate.addRow(phoneRow, at: node.parentTag)
    }
    private func drawPhoto(_ node: SchemaString) {
        let imageRow = ImageRow()
        imageRow.title = node.title()
        imageRow.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
        imageRow.clearAction = .yes(style: UIAlertAction.Style.destructive)
        delegate.addRow(imageRow, at: node.parentTag)
    }
    private func drawMapLocation(_ node: SchemaString) {
        
    }
}
