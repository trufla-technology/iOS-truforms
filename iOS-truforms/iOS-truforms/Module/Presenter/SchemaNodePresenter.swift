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
    
    func scan(schema: SchemaNode) -> (TreeNode<SchemaObjectProtocol>, TreeNode<SubmitNode>) {
        let id = UUID().uuidString
        // let value
        // Object -
                 // - Text
                 // - Array
                          // - Text
                 // - Array
                          // -Obj
                                 // - Text
                              
        let schemaObject = mapSchema(schema: schema)
        var tree = TreeNode<SchemaObjectProtocol>(value: schemaObject, children: [])
        let submitNode = SubmitNode(key: schema.type, id: id, isRequired: false)
        var treeSubmissin = TreeNode<SubmitNode>(value: submitNode, children: [])
        if schema.type == SchemaNodeConstants.SchemaType.ARRAY, let schema = schema.items?.value {
            let result = scan(schema: schema)
            tree.add(node: result.0)
            treeSubmissin.add(node: result.1)
        }
        guard schema.type == SchemaNodeConstants.SchemaType.OBJECT else {
            return (tree, treeSubmissin)
        }
        let properties = schema.properties
        var propertyList = [SchemaNode]()
        properties?.forEach { (key, value) in
            var schemaNode = value
            schemaNode.key = key
            propertyList.append(schemaNode)
        }
        let sorted = propertyList.sorted(by: <)
        sorted.forEach({
            let result = scan(schema: $0)
            tree.add(node: result.0)
            treeSubmissin.add(node: result.1)
        })
        return (tree, treeSubmissin)
    }
    
    
    
    func mapSchema(schema: SchemaNode) -> SchemaObjectProtocol {
        let types = SchemaNodeConstants.SchemaType.self
        let formats = SchemaNodeConstants.StringFormats.self
        //let keys = SchemaNodeConstants.SchemaKeywords.self
        switch schema.type {
        case types.STRING:
            if let _ = schema.enumuration {
                return SchemaEnum(schemaNode: schema)
            } else if let _ = schema.enumData {
                return SchemaEnumData(schemaNode: schema)
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
        case types.ARRAY:
            return SchemaArray(schemaNode: schema)
        case types.OBJECT:
            return SchemaObject(schemaNode: schema)
        default:
            return SchemaString(schemaNode: schema)
        }
    }
}

extension SchemaNodePresenter: SchemaNodePresenterProtocol {
    func present(response: SchemaNode) {
        let treeNode = scan(schema: response)
        view?.display(schema: treeNode)
    }
}


