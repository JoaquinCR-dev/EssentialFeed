//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Joaquín Corugedo on 1/12/24.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

}
