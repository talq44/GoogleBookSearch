//
//  BookItemDTO.swift
//  UserAPICore
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

// MARK: - 개별 책 항목
/// 개별 책 항목 정보를 담고 있는 구조체입니다.
public struct GoogleBookItem: Codable {
    /// 항목 종류 (예: "books#volume")
    public let kind: String
    /// 책의 고유 ID
    public let id: String
    /// 데이터 무결성을 확인하기 위한 ETag
    public let etag: String
    /// 현재 항목의 API 링크
    public let selfLink: String
    /// 책의 세부 정보
    public let volumeInfo: VolumeInfo
}
