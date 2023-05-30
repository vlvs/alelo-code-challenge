//
//  ProductMock.swift
//  Alelo ChallengeTests
//
//  Created by Vander on 30/05/23.
//

@testable import Alelo_Challenge

extension Product {
    static let mock = Product(
        codeColor: "20001609_029",
        name: "VESTIDO FRANZIDO RECORTES",
        onSale: true,
        regularPrice: "R$ 139,90",
        actualPrice: "R$ 69,90",
        installments: "2x R$ 34,95",
        image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20001609_002_catalog_1.jpg?",
        sizes: [
            Size(available: true, size: "PP"),
            Size(available: true, size: "P"),
            Size(available: true, size: "M"),
            Size(available: false, size: "G"),
            Size(available: false, size: "GG")
        ]
    )
}
