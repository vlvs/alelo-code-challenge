//
//  ProductCard.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct ProductCard: View {
    @State private var showAlert = false
    
    let product: Product
    let isInShoppingCart: Bool
    let cartConfirmationButtonTapped: (Product) -> Void
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.image)) { image in
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
                if !isInShoppingCart {
                    ForEach(product.sizes.filter { $0.available }, id: \.size) { availableSize in
                        Button("\(availableSize.size)") {
                            showAlert = true
                        }
                        .frame(width: 26)
                        .padding()
                        .border(.black)
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Adicionar produto no carrinho?"),
                                primaryButton: .default(Text("Sim")) {
                                    self.cartConfirmationButtonTapped(product)
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: .mock, isInShoppingCart: false, cartConfirmationButtonTapped: { _ in })
    }
}
