//
//  API+Method.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

import Moya

extension API {
    public var method: Moya.Method {
        switch self {
        case .health_check:
            return .get
        case .get_books_volumes:
            return .get
        case .get_books_volumes_detail:
            return .get
        }
    }
}
