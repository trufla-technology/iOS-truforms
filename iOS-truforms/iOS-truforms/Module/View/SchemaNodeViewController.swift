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
    func display(list: String)
}
class SchemaNodeViewController: BaseViewController {
    var interactor: SchemaNodeInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let module = SchemaNodeConfig()
        module.createModule(view: self)
        interactor?.fetch(id: "11")
        
        let data = convertToDictionary(text: SchemaNodeConstants.sampleData)
        // print("data: ", data)
        
    }
    deinit {
        print("\(SchemaNodeViewController.self) go away")
    }
    

    func convertToDictionary(text: String) -> Dictionary<String, Any>? {
          if let data = text.data(using: .utf8) {
              do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any>
              } catch {
                  print(error.localizedDescription)
              }
          }
          return nil
      }

}

extension SchemaNodeViewController: SchemaNodeViewProtocol {
    func display(list: String) {
        print(list.count)
    }
}
