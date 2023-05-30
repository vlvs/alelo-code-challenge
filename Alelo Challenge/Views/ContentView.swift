//
//  ContentView.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

let mockProducts = [mockProduct1, mockProduct2, mockProduct3]

let mockProduct1 = Product(
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

let mockProduct2 = Product(
    name: "REGATA ALCINHA FOLK",
    onSale: false,
    regularPrice: "R$ 99,90",
    actualPrice: "R$ 99,90",
    installments: "3x R$ 33,30",
    image: URL(string: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002570_002_catalog_1.jpg?1459948578"),
    sizes: [
        Size(available: true, size: "PP"),
        Size(available: true, size: "P"),
        Size(available: true, size: "M"),
        Size(available: true, size: "G"),
        Size(available: true, size: "GG")
    ]
)

let mockProduct3 = Product(
    name: "BOLSA FLAP TRIANGLE",
    onSale: true,
    regularPrice: "R$ 199,90",
    actualPrice: "R$ 159,90",
    installments: "3x R$ 53,30",
    image: URL(string: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002945_027_catalog_1.jpg?1459540966"),
    sizes: [
        Size(available: true, size: "U")
    ]
)

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ShoppingCartButton(productsInCart: [mockProduct3, mockProduct3, mockProduct1])
                ScrollView(.vertical) {
                    ForEach(mockProducts, id: \.name) { product in
                        ProductCard(product: product)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
