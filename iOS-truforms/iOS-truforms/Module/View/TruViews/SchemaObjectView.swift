//
//  SchemaObjectView.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/23/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaObjectView: SchemaBaseView<SchemaObject> {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    override func nibSetup() {
        //standard initialization logic
        let nib = UINib(nibName: "SchemaObjectView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
