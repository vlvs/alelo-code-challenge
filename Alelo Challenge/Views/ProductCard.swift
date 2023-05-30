//
//  ProductCard.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: product.image) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.size.width/2, height: 300)
                VStack(spacing: 30) {
                    Text(product.name)
                        .bold()
                        .multilineTextAlignment(.center)
                    VStack(spacing: 5) {
                        if product.onSale { Text(product.regularPrice).strikethrough() }
                        Text(product.actualPrice).bold()
                        Text(product.installments)
                    }
                }
            }
            HStack {
                ForEach(product.sizes.filter { $0.available }, id: \.size) { availableSize in
                    Button("\(availableSize.size)") {
                        // TODO: Implement Button action
                    }
                    .frame(width: 26)
                    .padding()
                    .border(.black)
                }
            }
        }
        .padding()
    }
}

struct ProductCard_Previews: PreviewProvider {
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
        ProductCard(product: product)
    }
}
