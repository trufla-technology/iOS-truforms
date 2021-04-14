//
//  SchemaDatePicker.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/21/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaDatePicker: SchemaBaseView<SchemaString> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    let formatter = DateFormatter()
    
    override func nibSetup() {
        // standard initialization logic
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        createDatePicker()
        setDatePicker()
        
        addSubview(contentView)
    }
    
    func createDatePicker() {
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
    }
    
    @objc func donePressed() {
        dateTextField.text = formatter.string(from: datePicker.date)
        self.contentView.endEditing(true)
    }
    
    
    func setDatePicker() {
        // date picker mood to show only date
        datePicker.datePickerMode = .date
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
    }
    
    func setTimePicker() {
        // date picker mood to show only time
        datePicker.datePickerMode = .time
        
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
    }
}
