//
//  ViewController.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import UIKit
import Eureka


// Now I will create Swift Clean Arch ... VIP Cycle (and I will break a retain cycle)
protocol SchemaNodeViewProtocol: class {
    // back to write something here
    func display(schema: TreeNode<SchemaObjectProtocol>)
    // enum data
    func display()
}

class SchemaNodeViewController: BaseViewController {
    @IBOutlet weak var stackView: UIStackView!
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
    }
    deinit {
        print("\(SchemaNodeViewController.self) go away")
    }
    
    func traverse(_ root: TreeNode<SchemaObjectProtocol>) {
        manager?.draw(root.value)
        for child in root.children {
            traverse(child)
        }
    }
}

extension SchemaNodeViewController: SchemaNodeViewProtocol {
    
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

extension SchemaNodeViewController: EurekaManagerDelegate {
    
    // Fetch Enum Data
    func handleEnumData(model: EnumDataRequest,data: @escaping ([String]) -> Void) {
        enumDataInteractor?.callEnumData(model: model, data: data)
    }
    
    //Generic Method to add Row
    func addRow <R:BaseRow> (_ row:R, at tag: String) {
        form.sectionBy(tag: tag)! <<< row
    }

    func addSection(title:String, with tag: String, at parentTag:String, ignoreTitle: Bool)  {
        var sectionTitle = ""
        if !ignoreTitle {
            sectionTitle = title
        }
        let section = Section(sectionTitle)
        section.tag = tag
        form +++ section
    }
    
    func insertSection(_ tag: String)  {
        
    }
}
