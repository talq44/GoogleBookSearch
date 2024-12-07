//
//  UserAPIProtocol.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 11/29/24.
//

import Foundation

public protocol UserAPIProtocol {
    func get_books(
        request: GetBooksRequestDTO
    ) async throws -> GoogleBooksResponse
    
    func get_books_$volumeId(
        request: GetBooksDetailReqeustDTO
    ) async throws -> GoogleBookDetailResponse
}
