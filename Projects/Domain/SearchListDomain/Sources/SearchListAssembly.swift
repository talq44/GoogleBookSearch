import Foundation

import SearchListDomainInterface
import UserAPICoreInterface

import Swinject

final public class SearchListAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(
            SearchListUseCase.self
        ) { r in
            let userAPI = r.resolve(UserAPIProtocol.self)!
            let repository = SearchListRepositoryImpl(
                remoteDatasource: userAPI
            )
            
            return SearchListUseCaseImpl(repository: repository)
        }
    }
}
