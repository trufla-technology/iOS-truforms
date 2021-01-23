//
//  SchemaArrayView.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/23/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaArrayView: SchemaBaseView<SchemaArray>  {
    
    @IBOutlet var contentView: UIView!
    
    override func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "SchemaArrayView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
