//
//  SearchViewReactor.swift
//  SearchFeature
//
//  Created by 박창규 on 11/30/24.
//

import Foundation

import SearchListDomainInterface
import ReactiveXShared

import ReactorKit
import RxSwift

final class SearchViewReactor: Reactor {
    typealias Action = SearchViewAction
    typealias Mutation = SearchViewMutation
    typealias State = SearchViewState
    
    var initialState: SearchViewState = .first
    
    private var query: String = ""
    private var items: [SearchViewItem] = []
    private var bookMarkIds: Set<Int> = []
    
    // MARK: - UseCases
    private let searchListUseCase: SearchListUseCase
    
#if DEBUG
    init(initialState: SearchViewState) {
        self.initialState = initialState
        
        self.searchListUseCase = FakeSearchListUseCase(
            count: initialState.testCount
        )
    }
#endif
    
    init(
        searchListUseCase: SearchListUseCase
    ) {
        self.searchListUseCase = searchListUseCase
    }
    
    func transform(action: Observable<Action>) -> Observable<Action> {
        // Apply throttle to limit action emissions
        return action.throttle(.milliseconds(500), scheduler: MainScheduler.instance)
    }
    
    func mutate(action: SearchViewAction) -> Observable<SearchViewMutation> {
        switch action {
        case let .refresh(query):
            guard query.count > 0 else {
                return .just(.setFirst)
            }
            
            return .concat([
                .just(.setLoading),
                self.mutateSearch(query: query, isMore: false)
            ])
            
        case let .inputSearch(query):
            guard query.count > 0 else {
                return .just(.setFirst)
            }
            
            return .concat([
                .just(.setLoading),
                self.mutateSearch(query: query, isMore: false)
            ])
        
        case let .didSelectSearch(query):
            guard query.count > 0 else {
                return .just(.setFirst)
            }
            
            return .concat([
                self.mutateSearch(query: query, isMore: false)
            ])
            
        case let .willDisplayLast(query):
            guard query == self.query else { return .empty() }
            
            return .concat([
                .just(.setLoading),
                self.mutateSearch(query: query, isMore: true)
            ])
        }
    }
    
    func reduce(
        state: SearchViewState,
        mutation: SearchViewMutation
    ) -> SearchViewState {
        var state = state
        switch mutation {
        case let .setSearchList(items, isMore):
            var nextItems = self.items
            if isMore {
                nextItems += items
            } else {
                nextItems = items
            }
            
            guard nextItems != self.items else { return state }
            
            self.items = nextItems
            
            state = .results(items: self.items)
            
        case let .updateSearchList(id, isBookmarked):
            guard let index = self.items.firstIndex(
                where: { $0.id == id }
            ) else {
                return state
            }
            self.items[index].isBookmarked = isBookmarked
            state = .results(items: self.items)
            
        case .setFirst:
            self.items = []
            state = .first
            
        case .setEmpty:
            self.items = []
            state = .noResults
            
        case .setLoading:
            state = .searching
            
        case .setError(let message):
            state = .error(message: message)
        }
        return state
    }
}

// MARK: - Search
extension SearchViewReactor {
    
    func mutateSearch(
        query: String,
        isMore: Bool
    ) -> Observable<SearchViewMutation> {
        let input = SearchListInputImpl(
            query: query,
            isMore: isMore
        )
        
        return Observable.create { [weak self] emitter in
            guard let self else {
                emitter.onCompleted()
                return Disposables.create()
            }
            
            Task {
                let response = await self.searchListUseCase.execute(input)
                
                switch response {
                case .success(let success):
                    let items = self.toViewState(response: success)
                    
                    guard items.count > 0 else {
                        guard isMore else {
                            emitter.onNext(.setEmpty)
                            emitter.onCompleted()
                            return
                        }
                        emitter.onNext(.setSearchList(items: items, isMore: isMore))
                        emitter.onCompleted()
                        return
                    }
                    self.query = query
                    
                    emitter.onNext(.setSearchList(items: items, isMore: isMore))
                    emitter.onCompleted()
                    
                case .failure(let error):
                    // 에러처리는 추후 추가
                    emitter.onNext(
                        .setError(message: error.localizedDescription)
                    )
                    emitter.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}

// MARK: - convert
extension SearchViewReactor {
    private func toViewState(
        response: SearchListOutput
    ) -> [SearchViewItem] {
        return response.items.map { _ in
            return SearchViewItem(
                id: 1,
                name: "$0.login",
                imageURL: "$0.avatarUrl",
                isBookmarked: false
            )
        }
    }
}
