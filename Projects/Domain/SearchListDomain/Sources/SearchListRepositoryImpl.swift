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
        
        do {
            let response = try await remoteDatasource.get_search_users(
                header: SearchHeaderDTO(
                    token: ""
                ),
                request: SearchRequestDTO(
                    q: request.query,
                    per_page: request.perPage,
                    page: request.page
                )
            )
            
            return .success(self.toDomain(response))
            
        } catch {
            guard let apiError = error as? UserAPICoreError else {
                return .failure(.unKnown)
            }
            return .failure(.restAPI(statusCode: apiError.statusCode))
        }
    }
    
    private func toDomain(_ response: SearchResponseDTO) -> SearchListResponse {
        return SearchListResponseImpl(
            totalCount: response.total_count,
            items: response.items.map {
                return SearchListItemImpl(
                    id: $0.id,
                    login: $0.login,
                    nodeId: $0.nodeId ?? "",
                    avatarUrl: $0.avatar_url
                )
            }
        )
    }
}
