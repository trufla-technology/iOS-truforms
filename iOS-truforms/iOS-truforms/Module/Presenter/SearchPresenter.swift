//
//  SearchPresenter.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

protocol SchemaNodePresenterProtocol {
    func present(response: SchemaNode)
}

class SchemaNodePresenter: CustomStringConvertible {
    // weak to break the retain cycle
    weak var view: SchemaNodeViewProtocol?
    
    var description: String {
        return String(describing: SchemaNodePresenter.self)
    }
    
    deinit {
        print("\(description) go away")
    }
}

extension SchemaNodePresenter: SchemaNodePresenterProtocol {
    func present(response: SchemaNode) {
        // let presentationList = response.map {SearchPresentationModel(model: $0)}
        // view?.display(list: presentationList)
    }
}
