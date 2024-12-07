//
//  SaleInfoDTO.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

// MARK: - 판매 정보
/// 책의 판매 정보를 담고 있는 구조체입니다.
public struct SaleInfoDTO: Codable {
    /// 판매 가능 국가 코드 (예: "US")
    public let country: String
    /// 판매 상태 (예: "NOT_FOR_SALE")
    public let saleability: String
    /// 전자책 여부
    public let isEbook: Bool
}
