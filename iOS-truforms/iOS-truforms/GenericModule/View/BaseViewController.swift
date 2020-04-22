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
    
    
    func configureNavigationBar(title:String,selector:Selector?) {
        self.navigationController?.navigationBar.barTintColor = .orange
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = title
        self.navigationController?.navigationBar.isTranslucent = false
        
    
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:selector )
    }
}

extension BaseViewController: BaseViewProtocol {
    func display(error: String) {
        print(error)
    }
}
