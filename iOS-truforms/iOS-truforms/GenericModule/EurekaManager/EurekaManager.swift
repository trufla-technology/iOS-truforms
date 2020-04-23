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
    
    func addSection(title:String)
    
    func addRow <R:BaseRow> (_ row:R)
}

class EurekaManager {
    weak var delegate:EurekaManagerDelegate!
    
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
            delegate.addSection(title: node.title())
    }
    private func drawArray(_ node: SchemaArray) {
        print(node.type(), ": ", node.title())
    }
    private func drawEnum(_ node: SchemaEnum) {
        print(node.type(), ": ", node.title())
        
        let pickerInputRow = PickerInputRow<String>()
        pickerInputRow.title = node.title()
    
        delegate.addRow(pickerInputRow)
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
        //        print("Text area: ", node.title())
        let textRow = TextRow()
        textRow.title = node.title()
        textRow.placeholder = node.title()
        
        delegate.addRow(textRow)
    }
    private func drawDate(_ node: SchemaString) {
        //        print(node.format, ": ", node.title())
        
        let dateRow = DateRow()
        
        dateRow.title = node.title()
        dateRow.value = Date(timeIntervalSinceReferenceDate: 0)
    
        delegate.addRow(dateRow)
    }
    private func drawDateTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
        let dateTimeRow = DateTimeRow()
        dateTimeRow.title = node.title()
        
        delegate.addRow(dateTimeRow)
    }
    private func drawTime(_ node: SchemaString) {
        print(node.format, ": ", node.title())
        let timeRow = TimeRow()
        timeRow.title = node.title()
        
        delegate.addRow(timeRow)
    }
    private func drawEmail(_ node: SchemaString) {
        //        print(node.format, ": ", node.title())
        let emailRow = EmailRow()
        emailRow.title = node.title()
        emailRow.placeholder = node.title()
        
        delegate.addRow(emailRow)
    }
    private func drawPhone(_ node: SchemaString) {
        //        print(node.format, ": ", node.title())
        let phoneRow = PhoneRow()
        phoneRow.title = node.title()
        phoneRow.placeholder = node.title()
        
        delegate.addRow(phoneRow)
    }
    private func drawPhoto(_ node: SchemaString) {
        //        print(node.format, ": ", node.title())
        let imageRow = ImageRow()
        
        imageRow.title = node.title()
        imageRow.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
        imageRow.clearAction = .yes(style: UIAlertAction.Style.destructive)
        
        delegate.addRow(imageRow)
    }
    private func drawMapLocation(_ node: SchemaString) {
        print(node.format, ": ", node.title())
    }
}
