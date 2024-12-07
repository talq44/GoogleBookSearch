//
//  GoogleBookDetailResponse.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

// MARK: - Google Books API 응답 구조체
/// Google Books API의 `/volumes/:volumeId` 응답 데이터를 나타내는 구조체입니다.
struct GoogleBookDetailResponse: Codable {
    /// 응답 데이터의 종류 (예: "books#volume")
    let kind: String
    /// 책의 고유 ID
    let id: String
    /// 데이터 무결성을 확인하기 위한 ETag
    let etag: String
    /// 현재 항목의 API 링크
    let selfLink: String
    /// 책의 상세 정보
    let volumeInfo: VolumeInfo
    /// 책의 판매 정보
    let saleInfo: SaleInfoDTO
    /// 책의 접근 권한 정보
    let accessInfo: AccessInfoDTO
}
