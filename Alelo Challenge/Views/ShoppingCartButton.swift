//
//  ShoppingCartButton.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct ShoppingCartButton: View {
    var productsInCart: [Product]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: ShoppingCartView(products: productsInCart)) {
                    Image(systemName: productsInCart.isEmpty ? "cart" : "cart.fill")
                        .font(.system(.largeTitle))
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(38.5)
                        .padding()
                }
                .padding()
            }
            Spacer()
        }
        .zIndex(1)
    }
}

struct ShoppingCartButton_Previews: PreviewProvider {
    static let product = Product(
        codeColor: "12948",
        name: "VESTIDO TRANSPASSE BOW",
        onSale: false,
        regularPrice: "R$ 199,90",
        actualPrice: "R$ 199,90",
        installments: "3x R$ 66,63",
        image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
        sizes: [
            Size(available: false, size: "PP"),
            Size(available: true, size: "P"),
            Size(available: true, size: "M"),
            Size(available: true, size: "G"),
            Size(available: false, size: "GG")
        ]
    )
    static var previews: some View {
        ShoppingCartButton(productsInCart: [product, product])
    }
}
