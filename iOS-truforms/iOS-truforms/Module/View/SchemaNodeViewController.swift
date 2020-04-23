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
    func display(schema: (TreeNode<SchemaObjectProtocol>, TreeNode<SubmitNode>))
}
class SchemaNodeViewController: BaseViewController {
    @IBOutlet weak var stackView: UIStackView!
    var interactor: SchemaNodeInteractorProtocol?
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
    func display(schema: (TreeNode<SchemaObjectProtocol>, TreeNode<SubmitNode>)) {
        // traverse tree here
        schema.0.printTree()
        configureNavigationBar(title: schema.0.value.title(), selector: nil)
        traverse(schema.0)
    }
}

extension SchemaNodeViewController: EurekaManagerDelegate {
    
    func addView()  {
        
    }
    
    func addText(title:String, placeHolder:String) {
        form  +++ TextRow(){ row in
            row.title = title
            row.placeholder = placeHolder
        }
    }
    
    func addEmailText(title:String, placeHolder:String) {
        form +++ EmailRow(){ row in
            row.title = title
            row.placeholder = placeHolder
        }
    }
    
    func addPhoneText(title:String, placeHolder:String) {
        form +++ PhoneRow(){
            $0.title = title
            $0.placeholder = placeHolder
        }
    }
    
    func addTime(title:String) {
        form +++ TimeRow(){
            $0.title = title
        }
    }
    
    func addDate(title:String) {
        form +++ DateRow(){
            $0.title = title
            $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
    
    func addDateTime(title:String) {
        form +++ DateTimeRow(){
            $0.title = title
        }
    }
    
    func addPicker(title:String) {
        form +++ PickerInputRow<String>("Picker Input Row"){
            $0.title = "Options"
            $0.options = []
            for i in 1...10{
                $0.options.append("option \(i)")
            }
            $0.value = $0.options.first
        }
    }
    
    func addSection(title:String)  {
        form +++ Section(title)
        
//        <<< DateTimeRow(){ row in
//             row.title = "Text Row"
//         }
//         <<< PhoneRow(){
//             $0.title = "Phone Row"
//             $0.placeholder = "And numbers here"
//         }
        
//     let section = Section(title)
//     form +++
//         section
//         myArray.forEach {
//             section <<< TextRow($0) {
//                 $0.title = $0.tag
//             }
//         }
    }
    
    func addImagePicker(title:String)  {
        form +++ ImageRow() { row in
            row.title = title
            row.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
            row.clearAction = .yes(style: UIAlertAction.Style.destructive)
        }
    }
}
