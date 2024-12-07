import Foundation

// MARK: - 책 세부 정보
/// 책의 세부 정보를 담고 있는 구조체입니다.
public struct VolumeInfo: Codable {
    /// 책 제목
    public let title: String
    /// 저자 목록
    public let authors: [String]?
    /// 출판사 이름
    public let publisher: String?
    /// 출판 날짜
    public let publishedDate: String?
    /// 책 설명
    public let description: String?
    /// 책의 페이지 수
    public let pageCount: Int?
    /// 출력 형식 (예: "BOOK")
    public let printType: String?
    /// 책의 카테고리 목록
    public let categories: [String]?
    /// 언어 코드 (예: "en")
    public let language: String
    /// 책의 미리보기 링크
    public let previewLink: String
    /// 책의 정보 링크
    public let infoLink: String
    /// 책의 정규화된 링크
    public let canonicalVolumeLink: String
}
