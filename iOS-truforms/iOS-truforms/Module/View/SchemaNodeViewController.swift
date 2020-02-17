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
    func display(schema: SchemaPresentationModel)
}
class SchemaNodeViewController: BaseViewController {
    @IBOutlet weak var stackView: UIStackView!
    var interactor: SchemaNodeInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let module = SchemaNodeConfig()
        module.createModule(view: self)
        interactor?.fetch(id: "11")
    }
    deinit {
        print("\(SchemaNodeViewController.self) go away")
    }
}

extension SchemaNodeViewController: SchemaNodeViewProtocol {
    func display(schema: SchemaPresentationModel) {
        guard let properties = schema.properties else {
            return
        }
        for (_, value) in properties {
            if let schema = value as? SchemaString {
                let textField = SchemaTextField(schema: schema)
                stackView.addSubview(textField.draw())
            }
        }
    }
}
