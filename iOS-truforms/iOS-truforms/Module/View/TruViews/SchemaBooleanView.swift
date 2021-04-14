//
//  SchemaBooleanView.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/23/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaBooleanView: SchemaBaseView<SchemaBool> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var boolSwitch: UISwitch!
    
    
    override func nibSetup() {
        // standard initialization logic
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(contentView)
    }
}
