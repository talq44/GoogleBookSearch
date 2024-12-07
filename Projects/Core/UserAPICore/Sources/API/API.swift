//
//  API.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

import UserAPICoreInterface

import Moya

public enum API {
    case health_check
    case get_books_volumes(request: GetBooksRequestDTO)
    case get_books_volumes_detail(request: GetBooksDetailReqeustDTO)
}

extension API: Moya.TargetType {
    public var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
}
