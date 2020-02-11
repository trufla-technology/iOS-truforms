//
//  SearchInteractor.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation
import Moya

protocol SchemaNodeInteractorProtocol {
    func fetch(id: String)
}

class SchemaNodeInteractor: BaseInteractor<SchemaNodeTarget, SchemaNode> {
    var presenter: SchemaNodePresenterProtocol?
    deinit {
          print("\(description) go away")
    }
}

extension SchemaNodeInteractor: SchemaNodeInteractorProtocol {
    func fetch(id: String) {
        request(targetType: .fetch(id: id)) { response in
            self.presenter?.present(response: response)
        }
    }
}

extension SchemaNodeInteractor: CustomStringConvertible {
    var description: String {
        return String(describing: SchemaNodeInteractor.self)
    }
}
