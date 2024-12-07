//
//  API+Header.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

extension API {
    public var headers: [String : String]? {
        switch self {
        case .health_check:
            return [:]
        case .get_books_volumes:
            return [:]
        case .get_books_volumes_detail:
            return [:]
        }
    }
}
