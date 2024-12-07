//
//  SearchListError.swift
//  SearchListDomainInterface
//
//  Created by 박창규 on 11/28/24.
//

import Foundation

public enum SearchListError: Error {
    case restAPI(statusCode: Int)
    /// 더보기 요청 전 패치 요청 필요
    case fetchRequiredBeforeMore
    case unKnown
    
    public var localizedDescription: String {
        switch self {
        case .restAPI(statusCode: let statusCode):
            return "Rest API Error: \(statusCode)"
        case .fetchRequiredBeforeMore:
            return "Fetch Required Before More"
        case .unKnown:
            return "Unknown Error"
        }
    }
}
