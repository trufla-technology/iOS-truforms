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
    
    func scan(schema: SchemaNode, tag: inout String, parentTage: String) -> TreeNode<SchemaObjectProtocol> {
        let schemaObject = mapSchema(schema: schema)
        var tree = TreeNode<SchemaObjectProtocol>(value: schemaObject, children: [])
        tree.value.tag = tag
        tree.value.parentTag = parentTage
        if schema.type == SchemaNodeConstants.SchemaType.ARRAY, let schema = schema.items?.value {
            tree.value.tag = "Array" + tag
            var newTag = "Array" + tag
            let result = scan(schema: schema, tag: &newTag, parentTage: tag)
            tree.add(node: result)
        }
        guard schema.type == SchemaNodeConstants.SchemaType.OBJECT else {
            return tree
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
            var newTag = UUID().uuidString
            var result = scan(schema: $0, tag: &newTag, parentTage: tag)
            result.value.parentTag = tag
            tree.add(node: result)
        })
        return tree
    }
    
    func mapSchema(schema: SchemaNode) -> SchemaObjectProtocol {
        let types = SchemaNodeConstants.SchemaType.self
        if let _ = schema.enumuration {
            return SchemaEnum(schemaNode: schema)
        } else if let _ = schema.enumData {
            return SchemaEnumData(schemaNode: schema)
        }
        switch schema.type {
        case types.STRING:
            return SchemaString(schemaNode: schema)
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
        // let schemaObject = mapSchema(schema: response)
        var tag = UUID().uuidString
        var treeNode = scan(schema: response, tag: &tag, parentTage: tag)
        treeNode.value.tag = tag
        view?.display(schema: treeNode)
    }
}


