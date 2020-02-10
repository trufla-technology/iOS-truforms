//
//  SearchConfig.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

class SearchConfig: BaseConfig {
    func createModule(view: SearchViewController) {
        let presenter = SearchPresenter()
        presenter.view = view
        let interactor = SearchInteractor()
        interactor.presenter = presenter
        interactor.basePresenter = handleBasePresenter(baseView: view)
        view.interactor = interactor
    }
}
