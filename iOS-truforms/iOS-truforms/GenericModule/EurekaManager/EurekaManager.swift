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
    
    func insertSection(_ childTag: String)
        
    func handleEnumData(model: EnumDataRequest, data: @escaping ([String]) -> Void)
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
    
    private func detectRaw(_ node: SchemaObjectProtocol) -> BaseRow {
        if let node = node as? SchemaObject {
            return createLabelRaw(node)
        }
        if let node = node as? SchemaEnum {
            return detectGenericPickerData(node)
        }
        if let node = node as? SchemaEnumData {
            return createLabelRaw(node)
        }
        if let node = node as? SchemaString {
            return detectStringRaw(node)
        }
        return createLabelRaw(node)
    }
    
    private func detectGenericPickerData(_ node: SchemaEnum) -> BaseRow {
        let items = node.itemsToDisplay()
        if items is [String] {
            let pickerInputRow: PickerInputRow<String> = createPickerInputRow(node)
            return pickerInputRow
        }
        let pickerInputRow: PickerInputRow<Int> = createPickerInputRow(node)
        return pickerInputRow
    }
    
    private func detectStringRaw(_ node: SchemaString) -> BaseRow{
        let formats = SchemaNodeConstants.StringFormats.self
        switch node.format {
        case formats.DATE:
            return createDateRow(node)
        case formats.DATETIME:
            return createDateTimeRow(node)
        case formats.EMAIL:
            return createEmailRow(node)
        case formats.MAPLOCATION:
            return createLocationRaw(node)
        case formats.PHONE:
            return createPhoneRow(node)
        case formats.PHOTO:
            return createPhotoRow(node)
        case formats.TIME:
            return createTimeRow(node)
        default:
            return createTextFieldRow(node)
        }
    }
    
    private func drawObject(_ node: SchemaObject) {
        delegate.addSection(title: node.title(), with: node.tag, at: node.parentTag, ignoreTitle: ignoreTitle)
        ignoreTitle = false
    }
    
    private func drawArray(_ node: SchemaArray) {
        delegate.insertSection(node.tag)
    }
    private func createPickerInputRow<T: Equatable>(_ node: SchemaEnum) -> PickerInputRow<T> {
        let items = node.itemsToDisplay()
        let pickerInputRow = PickerInputRow<T>()
        pickerInputRow.title = node.title()
        pickerInputRow.options = items as! [T]
        return pickerInputRow
    }
    private func drawEnum(_ node: SchemaEnum) {
        let items = node.itemsToDisplay()
        if items is [String] {
            let pickerInputRow: PickerInputRow<String> = createPickerInputRow(node)
            delegate.addRow(pickerInputRow, at: node.parentTag)
        }
        if items is [Int] {
            let pickerInputRow: PickerInputRow<Int> = createPickerInputRow(node)
            delegate.addRow(pickerInputRow, at: node.parentTag)
        }
    }
    private func drawEnumData(_ node: SchemaEnumData) {
        let model = EnumDataRequest(path: node.href, date: "", names: node.enumNames)
//        delegate.handleEnumData(model: model)
        delegate.handleEnumData(model: model) { (dataArr) in
            let items = dataArr
            let pickerInputRow = PickerInputRow<String>()
            pickerInputRow.title = node.title()
            pickerInputRow.options = items
            self.delegate.addRow(pickerInputRow, at: node.parentTag)
        }
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
    private func createTextFieldRow(_ node: SchemaObjectProtocol) -> TextRow {
        let textRow = TextRow()
        textRow.title = node.title()
        textRow.placeholder = node.title()
        return textRow
    }
    private func drawTextField(_ node: SchemaString) {
        let textRow = createTextFieldRow(node)
        delegate.addRow(textRow, at: node.parentTag)
    }
    private func createDateRow(_ node: SchemaObjectProtocol) -> DateRow {
        let dateRow = DateRow()
        dateRow.title = node.title()
        dateRow.value = Date(timeIntervalSinceReferenceDate: 0)
        return dateRow
    }
    private func drawDate(_ node: SchemaString) {
        let dateRow = createDateRow(node)
        delegate.addRow(dateRow, at: node.parentTag)
    }
    private func createDateTimeRow(_ node: SchemaObjectProtocol) -> DateTimeRow {
        let dateTimeRow = DateTimeRow()
        dateTimeRow.title = node.title()
        return dateTimeRow
    }
    private func drawDateTime(_ node: SchemaString) {
        let dateTimeRow = createDateTimeRow(node)
        delegate.addRow(dateTimeRow, at: node.parentTag)
    }
    private func createTimeRow(_ node: SchemaObjectProtocol) -> TimeRow {
        let timeRow = TimeRow()
        timeRow.title = node.title()
        return timeRow
    }
    private func drawTime(_ node: SchemaString) {
        let timeRow = createTimeRow(node)
        delegate.addRow(timeRow, at: node.parentTag)
    }
    private func createEmailRow(_ node: SchemaObjectProtocol) -> EmailRow {
        let emailRow = EmailRow()
        emailRow.title = node.title()
        emailRow.placeholder = node.title()
        return emailRow
    }
    private func drawEmail(_ node: SchemaString) {
        let emailRow = createEmailRow(node)
        delegate.addRow(emailRow, at: node.parentTag)
    }
    private func createPhoneRow(_ node: SchemaObjectProtocol) -> PhoneRow {
        let phoneRow = PhoneRow()
        phoneRow.title = node.title()
        phoneRow.placeholder = node.title()
        return phoneRow
    }
    private func drawPhone(_ node: SchemaString) {
        let phoneRow = createPhoneRow(node)
        delegate.addRow(phoneRow, at: node.parentTag)
    }
    private func createPhotoRow(_ node: SchemaObjectProtocol) -> ImageRow {
        let imageRow = ImageRow()
        imageRow.title = node.title()
        imageRow.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
        imageRow.clearAction = .yes(style: UIAlertAction.Style.destructive)
        return imageRow
    }
    private func drawPhoto(_ node: SchemaString) {
        let imageRow = createPhotoRow(node)
        delegate.addRow(imageRow, at: node.parentTag)
    }
    private func createLabelRaw(_ node: SchemaObjectProtocol) -> LabelRow {
        let labelRow = LabelRow()
        labelRow.title = node.title()
        return labelRow
    }
    private func drawLabel(_ node: SchemaObject) {
        let labelRow = createLabelRaw(node)
        delegate.addRow(labelRow, at: node.parentTag)
    }
    private func createLocationRaw(_ node: SchemaObjectProtocol) -> LocationRow {
        let locationRow = LocationRow()
        locationRow.title = node.title()
        return locationRow
    }
    private func drawMapLocation(_ node: SchemaString) {
    }
}
