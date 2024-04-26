import Foundation
import SwiftPresso

public struct WPDataSource {
    
    private let manager: PostListManagerProtocol
    
    public init(
        urlString: String,
        httpScheme: HTTPScheme,
        additionalHeaders: [AnyHashable: Any]?
    ) {
        
        guard let url = URL(string: "\(urlString)wp-json") else {
            assert(false, "Invalid URL")
        }
        
        manager = SwiftPressoFactory.makePostListManager(
            url: url,
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
