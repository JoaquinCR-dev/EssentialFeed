//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Joaquín Corugedo on 2/12/24.
//

import Foundation

public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from: URL,
             completion: @escaping (HTTPClientResult) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(url: URL,client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success(let hTTPURLResponse):
                completion(.invalidData)
            case .failure(let error):
                completion(.connectivity)
            }

        }
    }
}
