//
//  SchemaTextField.swift
//  iOS-truforms
//
//  Created by Trufla on 2/17/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialTextFields

class SchemaTextField2 {
    var schema: SchemaString
    
    init(schema: SchemaString) {
        self.schema = schema
    }
    
    func draw() -> MDCTextField {
        let textFieldFloating = MDCTextField(frame: CGRect(x: 20, y: 44 * schema.displayOrder(), width: 256, height: 40))
        textFieldFloating.placeholder = schema.title()
        // textFieldFloating.textView.delegate = self
        // textFieldControllerFloating = MDCTextInputControllerUnderline(textInput: textFieldFloating) // Hold on as a property
        return textFieldFloating
    }
}
