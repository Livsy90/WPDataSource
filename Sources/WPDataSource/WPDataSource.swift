import Foundation
import SwiftPresso

public struct WPDataSource {
    
    private let manager: PostListManagerProtocol
    
    public init(
        url: URL,
        httpScheme: HTTPScheme,
        additionalHeader: [AnyHashable: Any]?
    ) {
        
        manager = SwiftPressoFactory.makePostListManager(
            url: url,
            httpScheme: httpScheme,
            httpAdditionalHeaders: additionalHeader
        )
    }
    
    public func getPostList(page: Int) async -> Result<[RefinedPost], Error> {
        do {
            let postList = try await manager.getPosts(pageNumber: page)
            return .success(postList)
        } catch {
            return .failure(error)
        }
    }
    
}
