//
//  AccessInfoDTO.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

// MARK: - 접근 권한 정보
/// 책의 접근 권한 정보를 담고 있는 구조체입니다.
public struct AccessInfoDTO: Codable {
    /// 접근 가능한 국가 코드
    public let country: String
    /// 보기 가능 여부 (예: "PARTIAL")
    public let viewability: String
    /// 임베딩 가능 여부
    public let embeddable: Bool
    /// 퍼블릭 도메인 여부
    public let publicDomain: Bool
    /// 텍스트 음성 변환 권한 (예: "ALLOWED_FOR_ACCESSIBILITY")
    public let textToSpeechPermission: String
    /// 웹 리더 링크
    public let webReaderLink: String
    /// 접근 보기 상태 (예: "SAMPLE")
    public let accessViewStatus: String
    /// 인용 공유 가능 여부
    public let quoteSharingAllowed: Bool
}
