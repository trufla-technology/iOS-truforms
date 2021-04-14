//
//  SchemaTimePicker.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/21/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation

import UIKit

class SchemaTimePicker: SchemaBaseView<SchemaString> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func nibSetup() {
        // standard initialization logic
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        createTimePicker()
        
        addSubview(contentView)
    }
    
    func createTimePicker() {
        dateTextField.textAlignment = .center
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        dateTextField.inputAccessoryView = toolbar
        
        //assign date picker to view
        dateTextField.inputView = datePicker
        
        // date picker mood to show only date
        datePicker.datePickerMode = .time
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        dateTextField.text = formatter.string(from: datePicker.date)
        self.contentView.endEditing(true)
    }
}
