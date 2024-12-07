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
        
        return .failure(.unKnown)
    }
}
