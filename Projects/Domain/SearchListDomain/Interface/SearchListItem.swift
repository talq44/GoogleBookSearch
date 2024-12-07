import Foundation

public protocol SearchListItem {
    var id: String { get }
    var title: String { get }
    var thumbnail: String { get }
    var authors: String { get }
}
