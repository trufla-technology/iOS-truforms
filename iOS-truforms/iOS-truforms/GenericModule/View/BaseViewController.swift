//
//  BaseViewController.swift
//  CleanSwift
//
//  Created by Trufla on 2/4/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import UIKit
import Eureka
protocol BaseViewProtocol: class {
    func display(error: String)
}

class BaseViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension BaseViewController: BaseViewProtocol {
    func display(error: String) {
        print(error)
    }
}
