//
//  ProductRepository.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import Foundation

protocol ProductRepository {
    func getProducts(completion: @escaping ((Result<[Product], NetworkError>) -> Void))
}

final class ProductRepositoryImpl: ProductRepository {
    private let client: NetworkClient
    // TODO: Replace mocked endpoint with real API to make repository production-ready
    private let mockBaseUrl: String = "http://www.mocky.io"
    private let mockResourcePath: String = "/v2/59b6a65a0f0000e90471257d"

    init(client: NetworkClient = NetworkClientImpl()) {
        self.client = client
    }

    func getProducts(completion: @escaping ((Result<[Product], NetworkError>) -> Void)) {
        guard let url = URL(string: mockBaseUrl + mockResourcePath) else { return }
        client.request(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let products = try JSONDecoder.itemDecoder().decode([Product].self, from: data)
                    completion(.success(products))
                } catch let error {
                    completion(.failure(NetworkError.decoderFailed(error)))
                }
            case .failure(let error):
                completion(.failure(NetworkError.requestFailed(error)))
            }
        }
    }
}
