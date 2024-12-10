//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Joaquín Corugedo on 10/12/24.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from: URL,
             completion: @escaping (HTTPClientResult) -> Void)
}
