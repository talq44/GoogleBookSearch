//
//  SearchViewAssembly.swift
//  SearchFeature
//
//  Created by 박창규 on 12/1/24.
//

import Foundation

import SearchListDomainInterface
import SearchFeatureInterface

import Swinject

final public class SearchViewAssembly: Assembly {
    
    public init() { }
    public func assemble(container: Swinject.Container) {
        container.register(
            SearchFeatureOutput.self
        ) { r in
            
            let searchListUseCase = r.resolve(SearchListUseCase.self)!
            
            let reactor = SearchViewReactor(
                searchListUseCase: searchListUseCase
            )
            
            let viewController = SearchViewController(reactor: reactor)
                        
            return SearchFeatureOutputImpl(
                viewController: viewController
            )
        }
    }
}
