//
//  ViewController.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import UIKit
// Now I will create Swift Clean Arch ... VIP Cycle (and I will break a retain cycle)
protocol SearchViewProtocol: class {
    // back to write something here
    func display(list: [SearchPresentationModel])
}
class SearchViewController: BaseViewController {
    var interactor: SearchInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let module = SearchConfig()
        module.createModule(view: self)
        interactor?.search(keywords: "Search")
    }
    deinit {
        print("\(SearchViewController.self) go away")
    }
}

extension SearchViewController: SearchViewProtocol {
    func display(list: [SearchPresentationModel]) {
        print(list.count)
    }
}
