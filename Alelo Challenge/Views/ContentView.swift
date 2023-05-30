//
//  ContentView.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                ShoppingCartButton(productsInCart: self.viewModel.productsInCart)
                ScrollView(.vertical) {
                    ForEach(self.viewModel.products, id: \.codeColor) { product in
                        ProductCard(
                            product: product,
                            isInShoppingCart: false,
                            cartConfirmationButtonTapped: self.cartConfirmationButtonTapped
                        )
                    }
                }
            }
        }
    }
    
    private func cartConfirmationButtonTapped(for product: Product) {
        self.viewModel.addProductToCart(product)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
