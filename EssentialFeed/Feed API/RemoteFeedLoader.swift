//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Joaquín Corugedo on 2/12/24.
//

import Foundation

public protocol HTTPClient {
    func get(from: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient

    public init(url: URL,client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load() {
        client.get(from: url)
    }
}
