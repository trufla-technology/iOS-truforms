//
//  SchemaBaseView.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 11/5/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaBaseView<T: SchemaObjectProtocol>: UIView {
    
    var instance: T!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {}
}
