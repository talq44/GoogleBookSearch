//
//  UserAPICoreImpl+Extension.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

extension UserAPICoreImpl: UserAPICoreInterface.UserAPIProtocol {
    public func get_books(
        request: UserAPICoreInterface.GetBooksRequestDTO
    ) async throws -> UserAPICoreInterface.GoogleBooksResponse {
        return try await self.requestJson(
            .get_books_volumes(request: request),
            type: GoogleBooksResponse.self
        )
    }
    
    public func get_books_$volumeId(
        request: GetBooksDetailReqeustDTO
    ) async throws -> GoogleBookDetailResponse {
        return try await self.requestJson(
            .get_books_volumes_detail(request: request),
            type: GoogleBookDetailResponse.self
        )
    }
}
