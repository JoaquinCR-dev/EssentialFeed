//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Joaquín Corugedo on 1/12/24.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "https://www.google.com/")!)
    }
}

protocol HTTPClient {
    func get(from: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from: URL) {
        requestedURL = from
    }

    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)

        sut.load()

        XCTAssertNotNil(client.requestedURL)

    }

}
