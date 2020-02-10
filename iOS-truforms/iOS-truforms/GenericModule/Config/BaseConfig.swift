//
//  BaseConfig.swift
//  CleanSwift
//
//  Created by Trufla on 2/4/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import Foundation
class BaseConfig {
    func handleBasePresenter(baseView: BaseViewController) -> BasePresenter {
        let basePresenter = BasePresenter()
        basePresenter.baseView = baseView
        return basePresenter
    }
}
