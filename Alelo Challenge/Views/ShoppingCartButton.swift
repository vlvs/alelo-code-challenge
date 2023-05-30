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
    static var previews: some View {
        ShoppingCartButton(productsInCart: [.mock])
    }
}
