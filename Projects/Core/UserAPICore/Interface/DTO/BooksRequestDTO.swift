import Foundation

public struct GetBooksRequestDTO: Encodable {
    public let q: String
    public let startIndex: Int
    public let maxResults: Int
    
    public init(q: String, startIndex: Int, maxResults: Int) {
        self.q = q
        self.startIndex = startIndex
        self.maxResults = maxResults
    }
}
