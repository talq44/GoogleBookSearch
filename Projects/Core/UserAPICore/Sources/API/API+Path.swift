//
//  API+Parameters.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

extension API {
    public var path: String {
        switch self {
        case .health_check:
            return "/search/users"
        case .get_books_volumes:
            return "/books/v1/volumes"
        case .get_books_volumes_detail(let request):
            return "/books/v1/volumes/\(request.volumeId)"
        }
    }
}
