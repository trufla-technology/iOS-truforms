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
    
    override func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "SchemaBooleanView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
