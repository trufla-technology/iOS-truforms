//
//  ViewController.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import UIKit
import Eureka
import ImageRow

// Now I will create Swift Clean Arch ... VIP Cycle (and I will break a retain cycle)
protocol SchemaNodeViewProtocol: class {
    // back to write something here
    func display(schema: TreeNode<SchemaObjectProtocol>)
}
class SchemaNodeViewController: BaseViewController {
    @IBOutlet weak var stackView: UIStackView!
    var interactor: SchemaNodeInteractorProtocol?
    var manager: EurekaManager?
    var sectionTag: String!
    
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
        print(root.value.type(), ": ", root.value.parentTag)
        //manager?.draw(root.value)
        for child in root.children {
            traverse(child)
        }
    }
}

extension SchemaNodeViewController: SchemaNodeViewProtocol {
    func display(schema: TreeNode<SchemaObjectProtocol>) {
        // traverse tree here
        schema.printTree()
        configureNavigationBar(title: schema.value.title(), selector: nil)
        traverse(schema)
    }
}

extension SchemaNodeViewController: EurekaManagerDelegate {
    func addText(title:String, placeHolder:String, _ sectionTag: String) {
        form.sectionBy(tag: sectionTag)! <<< TextRow(){ row in
            row.title = title
            row.placeholder = placeHolder
        }
    }
    
    func addEmailText(title:String, placeHolder:String, _ sectionTag: String) {
        form.sectionBy(tag: sectionTag)! <<< EmailRow(){ row in
            row.title = title
            row.placeholder = placeHolder
        }
    }
    
    func addPhoneText(title:String, placeHolder:String, _ sectionTag: String) {
        form.sectionBy(tag: sectionTag)! <<< PhoneRow(){
            $0.title = title
            $0.placeholder = placeHolder
        }
    }
    
    func addDate(title:String, _ sectionTag: String) {
        form.sectionBy(tag: sectionTag)! <<< DateRow(){
            $0.title = title
            $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
    
    func addPicker(title:String, _ sectionTag: String) {
        form.sectionBy(tag: sectionTag)! <<< PickerInputRow<String>("Picker Input Row"){
            $0.title = "Options"
            $0.options = []
            for i in 1...10{
                $0.options.append("option \(i)")
            }
            $0.value = $0.options.first
        }
    }
    
    func addSection(title:String, _ sectionTag: String, _ parentTag: String)  {
        guard parentTag != "", let parentSection = form.sectionBy(tag: parentTag) else {
            let section = Section(title)
            section.tag = sectionTag
            form +++ section
            return
        }
        let section = Section(title)
        section.tag = sectionTag
        parentSection +++ section
    }
    
    func addImagePicker(title:String, _ sectionTag: String)  {
        form.sectionBy(tag: sectionTag)! <<< ImageRow() { row in
            row.title = title
            row.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
            row.clearAction = .yes(style: UIAlertAction.Style.destructive)
        }
    }
}
