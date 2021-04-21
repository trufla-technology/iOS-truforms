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
    
    func addSection(title:String, with tag: String, at parentTag: String, ignoreTitle: Bool)
    
    func addView<T:SchemaObjectProtocol, V: SchemaBaseView<T>>(view: V)
    
    func appendView<T:SchemaObjectProtocol, V: SchemaBaseView<T>>(view: V, index: Int)
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
            drawEnumDataPicker(node)
        }
        if let node = node as? SchemaString {
            drawString(node)
        }
    }
    
    func drawAtIndex(_ node: SchemaObjectProtocol, index: Int) {
        if let node = node as? SchemaObject {
            //drawObject(node)
            let s = SchemaObjectView()
            s.title.text = node.title()
            s.instance = node
            delegate.appendView(view: s, index: index)
        }
        
        if let node = node as? SchemaArray {
            let schemaArray = SchemaArrayView()
            schemaArray.instance = node
            schemaArray.title.text = node.title()
            delegate.appendView(view: schemaArray,index: index)
        }
        
        if let node = node as? SchemaEnum {
            let items = node.itemsToDisplay()
            let picker = SchemaEnumTextField()
            picker.textField.placeholder = node.title()
            picker.instance = node
            delegate.appendView(view: picker,index: index)
        }
        
        if let node = node as? SchemaEnumData {
            let schemaEnumDataTextField = SchemaEnumDataTextField()
            schemaEnumDataTextField.textField.placeholder = node.title()
            schemaEnumDataTextField.instance = node
            schemaEnumDataTextField.loadData()
            delegate.appendView(view: schemaEnumDataTextField, index: index)
        }
        
        if let node = node as? SchemaString {
            drawString(node,index: index)
        }
    }
    
    /*   private func detectRaw(_ node: SchemaObjectProtocol) -> BaseRow {
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
     }*/
    
    /*   private func detectGenericPickerData(_ node: SchemaEnum) -> BaseRow {
     let items = node.itemsToDisplay()
     if items is [String] {
     let pickerInputRow: PickerInputRow<String> = createPickerInputRow(node)
     return pickerInputRow
     }
     let pickerInputRow: PickerInputRow<Int> = createPickerInputRow(node)
     return pickerInputRow
     }
     */
    
    /*     private func detectStringRaw(_ node: SchemaString) -> BaseRow{
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
     */
    
    private func drawObject(_ node: SchemaObject) {
        delegate.addSection(title: node.title(), with: node.tag, at: node.parentTag, ignoreTitle: ignoreTitle)
        ignoreTitle = false
    }
    
    private func drawArray(_ node: SchemaArray) {
        let schemaArray = SchemaArrayView()
        schemaArray.instance = node
        schemaArray.title.text = node.title()
        delegate.addView(view: schemaArray)
    }
    
    private func drawEnumDataPicker(_ node: SchemaEnumData) {
        let schemaEnumDataTextField = SchemaEnumDataTextField()
        schemaEnumDataTextField.textField.placeholder = node.title()
        schemaEnumDataTextField.instance = node
        schemaEnumDataTextField.loadData()
        delegate.addView(view: schemaEnumDataTextField)
    }
    
    private func drawEnum(_ node: SchemaEnum) {
        let items = node.itemsToDisplay()
        let picker = SchemaEnumTextField()
        picker.textField.placeholder = node.title()
        picker.instance = node
        delegate.addView(view: picker)
        //        if items is [String] {
        //            let pickerInputRow: PickerInputRow<String> = createPickerInputRow(node)
        //            delegate.addRow(pickerInputRow, at: node.parentTag)
        //        }
        //        if items is [Int] {
        //            let pickerInputRow: PickerInputRow<Int> = createPickerInputRow(node)
        //            delegate.addRow(pickerInputRow, at: node.parentTag)
        //        }
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
    private func drawString(_ node: SchemaString,index: Int) {
        let formats = SchemaNodeConstants.StringFormats.self
        switch node.format {
        case formats.DATE:
            drawDate(node,index: index)
        case formats.DATETIME:
            drawDateTime(node,index: index)
        case formats.EMAIL:
            drawEmail(node,index: index)
        case formats.MAPLOCATION:
            drawMapLocation(node,index: index)
        case formats.PHONE:
            drawPhone(node,index: index)
        case formats.PHOTO:
            drawPhoto(node,index: index)
        case formats.TIME:
            drawTime(node,index: index)
        default:
            drawTextField(node,index: index)
        }
    }
    
    private func drawTextField(_ node: SchemaString) {
        let schemaTextField = SchemaTextField()
        schemaTextField.instance = node
        schemaTextField.textField.placeholder = node.title()
        delegate.addView(view: schemaTextField)
    }
    
    private func drawDate(_ node: SchemaString) {
        let schemaDatePicker = SchemaDatePicker()
        schemaDatePicker.instance = node
        schemaDatePicker.dateTextField.placeholder = node.title()
        delegate.addView(view: schemaDatePicker)
    }
    
    private func drawDateTime(_ node: SchemaString) {
        //        let dateTimeRow = createDateTimeRow(node)
        //        delegate.addRow(dateTimeRow, at: node.parentTag)
    }
    
    private func drawTime(_ node: SchemaString) {
        let timePicker = SchemaTimePicker()
        timePicker.instance = node
        timePicker.dateTextField.placeholder = node.title()
        delegate.addView(view: timePicker)
    }
    
    
    private func drawEmail(_ node: SchemaString) {
        let schemaTextField = SchemaTextField()
        schemaTextField.instance = node
        schemaTextField.textField.placeholder = node.title()
        delegate.addView(view: schemaTextField)
    }
    
    private func drawPhone(_ node: SchemaString) {
        let schemaTextField = SchemaTextField()
        schemaTextField.instance = node
        schemaTextField.textField.placeholder = node.title()
        delegate.addView(view: schemaTextField)
    }
    
    private func drawPhoto(_ node: SchemaString) {
        let photoPickerView = SchemaPhotoPickerView()
        photoPickerView.instance = node
        delegate.addView(view: photoPickerView)
    }
    
    private func drawLabel(_ node: SchemaObject) {
        let section = SchemaObjectView()
        section.instance = node
        section.title.text = node.title()
        delegate.addView(view: section)
    }
    
    private func drawMapLocation(_ node: SchemaString) {
        
    }
    
    private func drawTextField(_ node: SchemaString,index:Int) {
        let schemaTextField = SchemaTextField()
        schemaTextField.instance = node
        schemaTextField.textField.placeholder = node.title()
        delegate.appendView(view: schemaTextField, index: index)
    }
    
    private func drawDate(_ node: SchemaString,index:Int) {
        let schemaDatePicker = SchemaDatePicker()
        schemaDatePicker.instance = node
        schemaDatePicker.dateTextField.placeholder = node.title()
        delegate.appendView(view: schemaDatePicker, index: index)
    }
    
    private func drawDateTime(_ node: SchemaString,index:Int) {
        //        let dateTimeRow = createDateTimeRow(node)
        //        delegate.addRow(dateTimeRow, at: node.parentTag)
    }
    
    private func drawTime(_ node: SchemaString,index:Int) {
        let timePicker = SchemaTimePicker()
        timePicker.instance = node
        timePicker.dateTextField.placeholder = node.title()
        delegate.appendView(view: timePicker, index: index)
    }
    
    
    private func drawEmail(_ node: SchemaString,index:Int) {
        let schemaTextField = SchemaTextField()
        schemaTextField.instance = node
        schemaTextField.textField.placeholder = node.title()
        delegate.appendView(view: schemaTextField, index: index)
    }
    
    private func drawPhone(_ node: SchemaString,index:Int) {
        let schemaTextField = SchemaTextField()
        schemaTextField.instance = node
        schemaTextField.textField.placeholder = node.title()
        delegate.appendView(view: schemaTextField, index: index)
    }
    
    private func drawPhoto(_ node: SchemaString,index:Int) {
        let photoPickerView = SchemaPhotoPickerView()
        photoPickerView.instance = node
        delegate.appendView(view: photoPickerView, index: index)
    }
    
    private func drawLabel(_ node: SchemaObject,index:Int) {
        let section = SchemaObjectView()
        section.instance = node
        section.title.text = node.title()
        delegate.appendView(view: section, index: index)
    }
    
    private func drawMapLocation(_ node: SchemaString, index:Int) {
        
    }
}
