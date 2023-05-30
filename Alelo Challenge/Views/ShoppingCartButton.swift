//
//  ShoppingCartButton.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct ShoppingCartButton: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    // TODO: Implement Button action
                }, label: {
                    Image(systemName: "cart")
                        .font(.system(.largeTitle))
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.white)

                })
                .background(Color.black)
                .cornerRadius(38.5)
                .padding()
            }
            Spacer()
        }
        .zIndex(1)
    }
}

struct ShoppingCartButton_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartButton()
    }
}
