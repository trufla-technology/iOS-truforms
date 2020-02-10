//
//  Presenter.swift
//  CleanSwift
//
//  Created by Trufla on 2/4/20.
//  Copyright © 2020 Trufla. All rights reserved.
//
protocol BasePresenterProtocol {
    func present(error: String)
}
class BasePresenter {
    weak var baseView: BaseViewProtocol?
}

extension BasePresenter: BasePresenterProtocol {
    func present(error: String) {
        baseView?.display(error: error)
    }
}
