//
//  SchemaTextField.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/20/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaTextField: SchemaBaseView<SchemaString> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "SchemaTextField", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
