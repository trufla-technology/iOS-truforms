//
//  SearchConfig.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

class SchemaNodeConfig: BaseConfig {
    func createModule(view: SchemaNodeViewController) {
        let presenter = SchemaNodePresenter()
        presenter.view = view
        let interactor = SchemaNodeInteractor()
        interactor.presenter = presenter
        interactor.basePresenter = handleBasePresenter(baseView: view)
        let enumDataInteractor = EnumDataInteractor()
        let enumDataPresenter = EnumDataPresenter()
        enumDataInteractor.presenter = enumDataPresenter
        view.interactor = interactor
        view.enumDataInteractor = enumDataInteractor
    }
    
    func createModule(view: ViewController) {
           let presenter = SchemaNodePresenter()
           presenter.view = view
           let interactor = SchemaNodeInteractor()
           interactor.presenter = presenter
           interactor.basePresenter = handleBasePresenter(baseView: view)
           let enumDataInteractor = EnumDataInteractor()
           let enumDataPresenter = EnumDataPresenter()
           enumDataInteractor.presenter = enumDataPresenter
           view.interactor = interactor
           view.enumDataInteractor = enumDataInteractor
       }
}
