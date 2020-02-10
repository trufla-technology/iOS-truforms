//
//  SearchInteractor.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation
import Moya

protocol SearchInteractorProtocol {
    func search(keywords: String)
}

class SearchInteractor: BaseInteractor<SearchTarget, BaseResponse> {
    var presenter: SearchPresenterProtocol?
    deinit {
          print("\(description) go away")
    }
}

extension SearchInteractor: SearchInteractorProtocol {    
    func search(keywords: String) {
        request(targetType: .search(keywords: keywords)) { response in
            self.presenter?.present(response: response)
        }
    }
}

extension SearchInteractor: CustomStringConvertible {
    var description: String {
        return String(describing: SearchInteractor.self)
    }
}
