//
//  Product.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

struct Product: Decodable {
    let codeColor: String
    let name: String
    let onSale: Bool
    let regularPrice: String
    let actualPrice: String
    let installments: String
    let image: String
    let sizes: [Size]
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        guard lhs.codeColor == rhs.codeColor else { return false }
        guard lhs.name == rhs.name else { return false }
        guard lhs.onSale == rhs.onSale else { return false }
        guard lhs.regularPrice == rhs.regularPrice else { return false }
        guard lhs.actualPrice == rhs.actualPrice else { return false }
        guard lhs.installments == rhs.installments else { return false }
        guard lhs.image == rhs.image else { return false }
        guard lhs.sizes == rhs.sizes else { return false }
        return true
    }
}
