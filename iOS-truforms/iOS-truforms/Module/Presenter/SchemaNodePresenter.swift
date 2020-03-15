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
    
    func map(schema: SchemaNode) {
        guard let properties = schema.properties else {
            return
        }
        let pro = properties.mapValues { mapSchema(schema: $0) }
        print(pro["address"]?.type ?? "")
    }
    
    func scan(schema: SchemaNode) -> TreeNode<String> {
        var tree = TreeNode<String>(value: schema.type, children: [])
        if schema.type == SchemaNodeConstants.SchemaType.ARRAY, let schema = schema.items?.value {
            tree.add(node: scan(schema: schema))
        }
        guard schema.type == SchemaNodeConstants.SchemaType.OBJECT else {
            return tree
        }
        let properties = schema.properties
        let sorted = (properties?.map({$0.value}) ?? []).sorted(by: <)
        sorted.forEach({tree.add(node: scan(schema: $0))})
        return tree
    }
    
    func mapSchema(schema: SchemaNode) -> SchemaObjectProtocol {
        let types = SchemaNodeConstants.SchemaType.self
        let formats = SchemaNodeConstants.StringFormats.self
        //let keys = SchemaNodeConstants.SchemaKeywords.self
        switch schema.type {
        case types.STRING:
            if let _ = schema.enumuration {
                return SchemaEnum(schemaNode: schema)
            } else {
                switch schema.format {
                case formats.DATE:
                    return SchemaDate(schemaNode: schema)
                case formats.DATETIME:
                    return SchemaDate(schemaNode: schema)
                case formats.EMAIL:
                    return SchemaString(schemaNode: schema)
                case formats.MAPLOCATION:
                    return SchemaLocation(schemaNode: schema)
                case formats.PHONE:
                    return SchemaString(schemaNode: schema)
                case formats.PHOTO:
                    return SchemaPhoto(schemaNode: schema)
                case formats.TIME:
                    return SchemaDate(schemaNode: schema)
                default:
                    return SchemaString(schemaNode: schema)
                }
        }
        case types.BOOLEAN:
            return SchemaBool(schemaNode: schema)
        default:
            return SchemaString(schemaNode: schema)
        }
    }
}

extension SchemaNodePresenter: SchemaNodePresenterProtocol {
    func present(response: SchemaNode) {
        let treeNode = scan(schema: response)
        treeNode.printTree()
        view?.display(schema: treeNode)
    }
}
