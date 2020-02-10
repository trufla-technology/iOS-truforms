//
//  SearchPresentationModel.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

class SearchPresentationModel {
    var model: SearchModel?
    init(model: SearchModel) {
        self.model = model
    }
    
    var artistId: Int {
        guard let id = model?.artistId else {
            return -1
        }
        return id
    }
    var trackId: Int {
        guard let id = model?.trackId else {
            return -1
        }
        return id
    }
    var artistName: String {
        guard let name = model?.artistName else {
            return ""
        }
        return name
    }
    
}
