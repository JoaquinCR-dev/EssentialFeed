//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Joaquín Corugedo on 12/12/24.
//

import XCTest

class URLSessionHTTPCLient {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in

        }
    }
}

final class URLSessionHTTPClientTests: XCTestCase {

    func test_getFromURL_createsDataTaskWithURL() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPCLient(session: session)
        sut.get(from: url)

        XCTAssertEqual(session.receivedURLs, [url])
    }


    // MARK: -  Helpers
    
    private class URLSessionSpy: URLSession, @unchecked Sendable {
        var receivedURLs = [URL]()

        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return FakeURLSessionDataTask()
        }
    }

    private class FakeURLSessionDataTask: URLSessionDataTask, @unchecked Sendable {

    }

}
