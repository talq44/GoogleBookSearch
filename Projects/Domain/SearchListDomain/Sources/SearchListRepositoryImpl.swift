import Foundation

import SearchListDomainInterface
import UserAPICoreInterface

final class SearchListRepositoryImpl: SearchListRepository {
    
    private let remoteDatasource: UserAPIProtocol
    
    init(
        remoteDatasource: UserAPIProtocol
    ) {
        self.remoteDatasource = remoteDatasource
    }
    
    func fetch(
        _ request: any SearchListRequest
    ) async -> Result<any SearchListResponse, SearchListError> {
        let request = GetBooksRequestDTO(
            q: request.query,
            startIndex: request.page,
            maxResults: request.perPage
        )
        
        do {
            let response = try await self.remoteDatasource.get_books(
                request: request
            )
            
            return .success(self.toDomain(response))
        } catch {
            guard let apiError = error as? UserAPICoreError else {
                return .failure(.unKnown)
            }
            return .failure(.restAPI(statusCode: apiError.statusCode))
        }
    }
    
    private func toDomain(
        _ response: GoogleBooksResponse
    ) -> SearchListResponse {
        return SearchListResponseImpl(
            totalCount: response.totalItems,
            items: (response.items ?? []).map {
                let tunmbnail = $0.imageLinks?.thumbnail ??
                $0.imageLinks?.smallThumbnail ??
                ""
                
                return SearchListItemImpl(
                    id: $0.id,
                    title: $0.volumeInfo.title,
                    thumbnail: tunmbnail,
                    authors: ($0.volumeInfo.authors ?? [])
                        .joined(separator: ",")
                )
            }
        )
    }
}
