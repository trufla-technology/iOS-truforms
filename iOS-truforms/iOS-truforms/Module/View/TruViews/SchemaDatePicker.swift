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
    
    override func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "SchemaDatePicker", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        createDatePicker()
        contentView.frame = bounds
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
