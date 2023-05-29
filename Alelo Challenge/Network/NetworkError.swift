//
//  NetworkError.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

enum NetworkError: Error, CustomStringConvertible {
    case noData
    case decoderFailed(Error)
    case requestFailed(Error)

    var description: String {
        switch self {
        case .noData:
            return "Data not found"
        case .decoderFailed(let error):
            return "Failed to decode data: \(error)"
        case .requestFailed(let error):
            return "Failed to complete request: \(error)"
        }
    }
}

extension NetworkError: Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.noData, .noData), (.decoderFailed(_), .decoderFailed(_)), (.requestFailed(_), .requestFailed(_)):
            return true
        default:
            return false
        }
    }
}
