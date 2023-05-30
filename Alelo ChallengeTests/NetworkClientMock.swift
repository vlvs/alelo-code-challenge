//
//  NetworkClientMock.swift
//  Alelo ChallengeTests
//
//  Created by Vander on 30/05/23.
//

@testable import Alelo_Challenge
import Foundation

final class NetworkClientMock: NetworkClient {
    private let mockResult: Result<Data, NetworkError>

    init(mockResult: Result<Data, NetworkError>) {
        self.mockResult = mockResult
    }

    func request(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        completion(mockResult)
    }
}
