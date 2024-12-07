//
//  StubSearchListItem.swift
//  SearchListDomainTesting
//
//  Created by 박창규 on 11/29/24.
//

import Foundation

import SearchListDomainInterface

import Fakery

struct StubSearchListItem: SearchListItem {
    var id: String
    var title: String
    var thumbnail: String
    var authors: String
    
    static func mock(id: String) -> Self {
        let fake = Faker()
        
        return StubSearchListItem(
            id: id,
            title: fake.commerce.productName(),
            thumbnail: fake.internet.image(),
            authors: fake.name.firstName()
        )
    }
}
