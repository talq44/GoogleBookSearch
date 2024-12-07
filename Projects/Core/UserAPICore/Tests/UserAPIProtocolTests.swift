import XCTest

import UserAPICoreInterface
@testable import UserAPICore

final class UserAPIProtocolTests: XCTestCase {
    
    private var dataSource: UserAPIProtocol!
    override func setUpWithError() throws {
        self.dataSource = UserAPICoreImpl(
            baseURL: Constants.baseURL
        )
    }

    override func tearDownWithError() throws {
        self.dataSource = nil
    }

    func test_given_검색어입력_when_request_then_결과돌려줌() async throws {
        // given
        let q = "검색"
        let request = GetBooksRequestDTO(
            q: q,
            startIndex: 0,
            maxResults: 30
        )
        
        do {
            // when
            let response = try await dataSource.get_books(request: request)
            
            // then
            XCTAssertTrue(
                (response.items?.count ?? 0) > 0,
                "정상적인 통신을 하면, 결과가 반환되어야 합니다."
            )
        } catch {
            throw error
        }
    }
}
