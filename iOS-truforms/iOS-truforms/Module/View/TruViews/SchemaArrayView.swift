//
//  SchemaArrayView.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 1/23/21.
//  Copyright © 2021 Trufla. All rights reserved.
//

import Foundation
import UIKit

class SchemaArrayView: SchemaBaseView<SchemaArray> {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    
    var delegate: AppendViewDelegate!
    
    override func nibSetup() {
        // standard initialization logic
        backgroundColor = .clear
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(contentView)
        
    }
    
    @IBAction func addOrDeleteView(_ sender: Any) {
        delegate.append(child: self, node: instance)
    }
}

protocol AppendViewDelegate {
    func append(child: UIView, node: SchemaObjectProtocol)
}
