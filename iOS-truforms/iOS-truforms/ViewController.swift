//
//  ViewController.swift
//  iOS-truforms
//
//  Created by Trufla on 2/10/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import UIKit
import Eureka

class ViewController: BaseViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    var interactor: SchemaNodeInteractorProtocol?
    var enumDataInteractor: EnumDataInteractorProtocol?
        
    var manager: EurekaManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager = EurekaManager()
        manager?.delegate = self
        let module = SchemaNodeConfig()
        module.createModule(view: self)
        interactor?.fetch(id: "11")
        
        //Stack View
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
//        stackView.alignment = UIStackView.Alignment.center
//         stackView.spacing   = 16.0
//         stackView.translatesAutoresizingMaskIntoConstraints = true

        stackViewHeight.constant = stackView.frame.height
        
        stackView.backgroundColor = .red
        //Constraints
//        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func traverse(_ root: TreeNode<SchemaObjectProtocol>) {
        manager?.draw(root.value)
        for child in root.children {
            traverse(child)
        }
    }
}

extension ViewController: SchemaNodeViewProtocol {
    
    func display() {
        // eureka mana
        print("Yalla")
    }
    
    func display(schema: TreeNode<SchemaObjectProtocol>) {
        // traverse tree here
        schema.printTree()
        configureNavigationBar(title: schema.value.title(), selector: nil)
        traverse(schema)
    }
}

extension ViewController: EurekaManagerDelegate {
    func insertSection(_ childTag: String) {
        
    }
    
    func addArraySection(title: String, with tag: String, at parentTag: String, ignoreTitle: Bool) {
   
    }
    
    // Fetch Enum Data
    func handleEnumData(model: EnumDataRequest,data: @escaping ([String]) -> Void) {
        
    }
    
    //Generic Method to add Row
    func addRow <R:BaseRow> (_ row:R, at tag: String) {
        
    }

    func addSection(title:String, with tag: String, at parentTag:String, ignoreTitle: Bool)  {
        let s = SchemaObjectView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.title.text = title
        stackView.addArrangedSubview(s)
    }
    
    func drawDate(title: String) {
        let s = SchemaDatePicker(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.dateTextField.placeholder = title
        stackView.addArrangedSubview(s)
    }
}
