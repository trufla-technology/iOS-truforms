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
    func display(schema: TreeNode<SchemaObjectProtocol>) {
        // traverse tree here
        schema.printTree()
        configureNavigationBar(title: schema.value.title(), selector: nil)
        traverse(schema)
    }
}

extension SchemaNodeViewController: EurekaManagerDelegate {
    
    //Generic Method to add Row
    func addRow <R:BaseRow> (_ row:R, at tag: String)  {
        form.sectionBy(tag: tag)! <<< row
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
    
    func addSection(title:String, with tag: String, at parentTag:String, ignoreTitle: Bool)  {
        var sectionTitle = ""
        if !ignoreTitle {
            sectionTitle = title
        }
        let section = Section(sectionTitle)
        section.tag = tag
        form +++ section
        
        /*if let parentSection = form.sectionBy(tag: parentTag) {
         parentSection +++ section
         } else {
         }*/
    }
    
    
  
    func insertSection()  {
        form +++  ButtonRow() {
            $0.title = "Add"
            $0.cellStyle = .value1
        }.cellUpdate { cell, _ in
            cell.textLabel?.textAlignment = .left
            cell.imageView?.image = UIImage(named:"plus_image")
            
        }.onCellSelection { cell, row in
            let dynamicSection = Section("Dynamic Section")
                    <<< TextRow(){ row in
                        row.title = "Text Row"
                        row.placeholder = "Enter text here"
                    }
                    <<< PhoneRow(){
                        $0.title = "Phone Row"
                        $0.placeholder = "And numbers here"
                    }
                self.form.insert(dynamicSection, at: (row.indexPath?.section)!)
            }
        }
        
        
    }
    func addMapLocation()  {
        //       form +++ LocationRow(){
        //            $0.title = "Location"
        //            $0.value = CLLocation(latitude: latitude, longitude: longitude)
        //            $0.tag = "location"
        //            $0.validationOptions = .validatesOnChange //2
        //            $0.cellUpdate { (cell, row) in //3
        //                if !row.isValid {
        //                    cell.textLabel?.textColor = .red
        //                } else {
        //                    let lastLocation = row.value
        //                    let geocoder = CLGeocoder()
        //                    geocoder.reverseGeocodeLocation(lastLocation!,
        //                        completionHandler: { (placemarks, error) in
        //                            if error == nil {
        //                                let place = placemarks![0]
        //                                var adressString : String = ""
        //                                if place.thoroughfare != nil {
        //                                    adressString = adressString + place.thoroughfare! + ", "
        //                                }
        //                                if place.subThoroughfare != nil {
        //                                    adressString = adressString + place.subThoroughfare! + " "
        //                                }
        //                                if place.locality != nil {
        //                                    adressString = adressString + place.locality! + " - "
        //                                }
        //                                if place.postalCode != nil {
        //                                    adressString = adressString + place.postalCode! + " "
        //                                }
        //                                if place.subAdministrativeArea != nil {
        //                                    adressString = adressString + place.subAdministrativeArea! + " - "
        //                                }
        //                                if place.country != nil {
        //                                    adressString = adressString + place.country!
        //                                }
        //
        //                                self.address = adressString.trimmingCharacters(in: .whitespacesAndNewlines)
        //                            }
        //                    })
        //                }
        //            }
        //        }
    }
