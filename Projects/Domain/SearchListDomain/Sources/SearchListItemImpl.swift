import Foundation

import SearchListDomainInterface

struct SearchListItemImpl: SearchListItem {
    let id: String
    let title: String
    let thumbnail: String
    let authors: String
}
