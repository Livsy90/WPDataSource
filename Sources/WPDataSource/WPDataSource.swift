import Foundation
import SwiftPresso

public struct WPDataSource {
    
    private let manager: PostListManagerProtocol
    
    public init(
        host: String,
        httpScheme: HTTPScheme,
        additionalHeaders: [AnyHashable: Any]?
    ) {
        
        manager = SwiftPressoFactory.postListManager(
            host: host,
            httpScheme: httpScheme,
            httpAdditionalHeaders: additionalHeaders
        )
    }
    
}

public extension WPDataSource {
    
    func getPostList(page: Int) async -> Result<[Post], Error> {
        do {
            let postList = try await manager.getPosts(pageNumber: page)
            return .success(postList)
        } catch {
            return .failure(error)
        }
    }
    
}
