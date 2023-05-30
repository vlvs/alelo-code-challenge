//
//  Size.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

struct Size: Decodable {
    let available: Bool
    let size: String
}

extension Size: Equatable {
    static func == (lhs: Size, rhs: Size) -> Bool {
        guard lhs.available == rhs.available else { return false }
        guard lhs.size == rhs.size else { return false }
        return true
    }
}
