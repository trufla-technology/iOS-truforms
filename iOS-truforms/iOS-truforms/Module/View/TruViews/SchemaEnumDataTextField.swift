//
//  SchemaEnumData.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/23/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit


class SchemaEnumDataTextField: SchemaBaseView<SchemaEnumData> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    let pickerView = UIPickerView()
    
    var myPickerData = [String](arrayLiteral: "Dummy", "Data", "For", "Testing")
    
    let enumDataInteractor = EnumDataInteractor()
    
    override func nibSetup() {
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        createPicker()
        
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
    
    func loadData()  {
        let model = EnumDataRequest(path: instance.href, date: "", names: instance.enumNames)
        enumDataInteractor.callEnumData(model: model, data: { (values) in
            self.myPickerData = values
            print(values)
        })
    }
    
    @objc func donePressed() {
        self.contentView.endEditing(true)
    }
}

extension SchemaEnumDataTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
