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
        nibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    func nibSetup() {}
    
    func getInputValue()-> String {}
}
