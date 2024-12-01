//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Joaquín Corugedo on 1/12/24.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://www.google.com/")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()

    func get(from: URL) {}
}

class HTTPClientSpy: HTTPClient {
    override func get(from: URL) {
        requestedURL = from
    }

    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClientSpy.shared = client
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClientSpy.shared = client
        let sut = RemoteFeedLoader()

        sut.load()

        XCTAssertNotNil(client.requestedURL)

    }

}
