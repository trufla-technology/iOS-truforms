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
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(contentView)
    }
    
    override func getInputValue() -> String {
        let str  =  String(format:"\"%s\":{}", instance.key())
        //TODO: handle object childs
        
        
        return str
    }
}
