//
//  BooksDetailReqeustDTO.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 12/7/24.
//

import Foundation

public struct GetBooksDetailReqeustDTO: Encodable {
    public let volumeId: String
    public init(volumeId: String) {
        self.volumeId = volumeId
    }
}
