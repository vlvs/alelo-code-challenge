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
                ForEach(products, id: \.codeColor) { product in
                    ProductCard(
                        product: product,
                        isInShoppingCart: true,
                        cartConfirmationButtonTapped: { _ in }
                    )
                }
            }
        }
        .navigationTitle("Carrinho")
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView(products: [.mock])
    }
}
