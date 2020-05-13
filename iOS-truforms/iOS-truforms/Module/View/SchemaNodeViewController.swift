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
    
    func addArraySection(title: String, with tag: String, at parentTag: String, ignoreTitle: Bool) {
     addSection(title: title, with: tag, at: parentTag, ignoreTitle: ignoreTitle)
        form.sectionBy(tag: tag)! <<< ButtonRow() { (row: ButtonRow) in
            row.title = "Add More"
            //row.presentationMode = .SegueName(segueName: "AccesoryViewControllerSegue", completionCallback: nil)
        }
        .onCellSelection({ (cell, row) in
            let section = self.form.sectionBy(tag: tag)
            print(section?.allRows)
            for row in section!.allRows {
                print(row.title)
            }
            let x = Section(title)
                                <<< TextRow(){ row in
                                    row.title = "Text Row"
                                    row.placeholder = "Enter text here"
                                }
                                <<< PhoneRow(){
                                    $0.title = "Phone Row"
                                    $0.placeholder = "And numbers here"
                                }
            self.form.insert(x, at: row.indexPath!.section + 1)
//            self.form.insert(section, atIndex: (row.indexPath()?.section)!)
        })
    }
    
    
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
        form +++ LabelRow(){
            $0.title = "Array Title"
        }}
}
