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
        var schemaPresentationModel = SchemaPresentationModel(title: response.title, description: response.description, properties: [:], required: response.required, oneOf: response.oneOf)
        if let properties = response.properties {
            for (key, value) in properties {
                switch value.type {
                case SchemaNodeConstants.SchemaType.STRING:
                    if let format = value.format {
                        if format.isEmpty {
                            schemaPresentationModel.properties?[key] = SchemaString(schemaNode: value, key: key)
                        } else {
                            switch format {
                            case SchemaNodeConstants.StringFormats.DATE:
                                print("Date")
                            default:
                                print("Others")
                            }
                        }
                    }
                default:
                    break
                }
            }
        }
        view?.display(schema: schemaPresentationModel)
    }
}
