//
//  ImageLinksDTO.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

// MARK: - 이미지 링크
/// 책의 이미지 링크를 담고 있는 구조체입니다.
public struct ImageLinksDTO: Codable {
    /// 작은 썸네일 URL
    public let smallThumbnail: String?
    /// 썸네일 URL
    public let thumbnail: String?
}
