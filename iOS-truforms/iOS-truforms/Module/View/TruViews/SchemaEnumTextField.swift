//
//  SchemaEnumTextField.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/21/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaEnumTextField: SchemaBaseView<SchemaEnum> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    let pickerView = UIPickerView()
    
    let myPickerData = [String](arrayLiteral: "Dummy", "Data", "For", "Testing")
    
    override func initSubviews() {
        let nib = UINib(nibName: "SchemaEnumTextField", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        createPicker()
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func createPicker() {
        textField.textAlignment = .center
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        textField.inputAccessoryView = toolbar
        
        //assign date picker to view
        textField.inputView = pickerView
        
        pickerView.delegate = self
    }
    
    @objc func donePressed() {
        self.contentView.endEditing(true)
    }
}

extension SchemaEnumTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = myPickerData[row]
    }
}
