//
//  NetworkClient.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import Foundation

protocol NetworkClient {
    func request(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class NetworkClientImpl: NetworkClient {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func request(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    completion(.failure(NetworkError.requestFailed(error)))
                    return
                }
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
