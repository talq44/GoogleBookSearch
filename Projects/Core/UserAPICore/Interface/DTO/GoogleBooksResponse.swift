//
//  GetBooksResponseDTO.swift
//  UserAPICore
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

// MARK: - 최상위 응답 구조체
/// Google Books API의 최상위 응답을 나타냅니다.
public struct GoogleBooksResponse: Codable {
    /// 응답 종류 (예: "books#volumes")
    public let kind: String
    /// 검색된 총 아이템 개수
    public let totalItems: Int
    /// 검색 결과로 내려오는 책 목록
    public let items: [GoogleBookItem]?
}
