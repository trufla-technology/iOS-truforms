//
//  EnumDataPresenter.swift
//  iOS-truforms
//
//  Created by Mohamed Salah on 4/27/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation


protocol EnumDataPresenterProtocol {
//    func requestData(schemaEnumData:SchemaEnumData)
    func present()
}

class EnumDataPresenter : EnumDataPresenterProtocol {
    
    // weak to break the retain cycle
    weak var view: SchemaNodeViewProtocol?
    
    
//    func requestData(schemaEnumData: SchemaEnumData) {
//        let path = schemaEnumData.href
//        let names = schemaEnumData.enumNames
//        let identifierColumn = schemaEnumData.id
//
//
//        // TODO request data
//    }
    
    func present() {
        //convert response to presentation obejects
        // pass it to display method 
        view?.display()
    }
}
