//
//  ShoppingCartView.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct ShoppingCartView: View {
    var products: [Product]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(products, id: \.name) { product in
                    ProductCard(product: product)
                }
            }
        }
        .navigationTitle("Carrinho")
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static let product = Product(
        name: "VESTIDO TRANSPASSE BOW",
        onSale: false,
        regularPrice: "R$ 199,90",
        actualPrice: "R$ 199,90",
        installments: "3x R$ 66,63",
        image: URL(string: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912"),
        sizes: [
            Size(available: false, size: "PP"),
            Size(available: true, size: "P"),
            Size(available: true, size: "M"),
            Size(available: true, size: "G"),
            Size(available: false, size: "GG")
        ]
    )
    static var previews: some View {
        ShoppingCartView(products: [product, product])
    }
}
