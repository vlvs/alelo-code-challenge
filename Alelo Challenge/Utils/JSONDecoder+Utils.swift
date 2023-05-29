//
//  JSONDecoder+Utils.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import Foundation

extension JSONDecoder {
    static func itemDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
