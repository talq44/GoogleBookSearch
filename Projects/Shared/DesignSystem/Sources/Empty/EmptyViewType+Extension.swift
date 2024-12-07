//
//  EmptyViewType+Extension.swift
//  DesignSystem
//
//  Created by 박창규 on 11/29/24.
//

import Foundation

extension EmptyViewType {
    var title: String {
        switch self {
        case .normal:
            return "목록이 없어요!"
        case .search:
            return "검색 결과가 없어요!"
        }
    }
    
    var subTitle: String {
        switch self {
        case .normal:
            return "이 카테고리에 대한 내용이 없습니다."
        case .search:
            return "다른 검색어를 통해 원하는 결과를 찾아보세요."
        }
    }
    
    var imageName: String {
        switch self {
        case .normal:
            return "doc.questionmark"
        case .search:
            return "magnifyingglass.circle"
        }
    }
}
