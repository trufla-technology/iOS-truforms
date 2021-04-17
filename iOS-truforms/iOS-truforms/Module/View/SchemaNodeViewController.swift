//
//  ViewController.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import UIKit


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
    func appendView<T, V>(view: V, index: Int) where T : SchemaObjectProtocol, V : SchemaBaseView<T> {
        
    }
    
    func createView<T, V>(view: V) where T : SchemaObjectProtocol, V : SchemaBaseView<T> {
        
    }
    
    func addViewAtIndex<T, V>(view: V, index: Int) where T : SchemaObjectProtocol, V : SchemaBaseView<T> {
        
    }
    
    func addView<T, V>(view: V) where T : SchemaObjectProtocol, V : SchemaBaseView<T> {
        
    }
    
    func addViewInstance<Instance>(view: SchemaBaseView<Instance>) where Instance : SchemaObjectProtocol {
        
    }
    func addArraySection(view: SchemaArrayView, with tag: String, at parentTag: String, ignoreTitle: Bool) {
        
    }
    
    func drawEnumDataPicker(node: SchemaEnumData) {
        
    }
    
    func drawEnumDataPicker(title: String) {
        
    }
    
    func drawPhotoPikcer(title: String) {
        
    }
    
    func drawTimePicker(title: String) {
        
    }
    
    func drawTextField(title: String) {
        
    }
    
    func drawDate(title: String) {
        
    }
    
    func drawDate() {
        
    }
    
    
    func addArraySection(title: String, with tag: String, at parentTag: String, ignoreTitle: Bool) {
    
    }
    
    
    // Fetch Enum Data
    func handleEnumData(model: EnumDataRequest,data: @escaping ([String]) -> Void) {
    }
    


    func addSection(title:String, with tag: String, at parentTag:String, ignoreTitle: Bool)  {

    }
    
    func insertSection(_ tag: String)  {
       
}
}
