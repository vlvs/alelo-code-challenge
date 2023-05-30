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
