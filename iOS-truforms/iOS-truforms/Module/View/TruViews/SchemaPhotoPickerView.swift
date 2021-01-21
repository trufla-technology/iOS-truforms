//
//  SchemaPhotoPickerView.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/21/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaPhotoPickerView: SchemaBaseView<SchemaString> {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func initSubviews() {
        // standard initialization logic
          let nib = UINib(nibName: "SchemaPhotoPickerView", bundle: nil)
          nib.instantiate(withOwner: self, options: nil)
          contentView.frame = bounds
          addSubview(contentView)
    }
}
