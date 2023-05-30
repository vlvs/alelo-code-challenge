//
//  ContentViewModel.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import Foundation
import OSLog

final class ContentViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var productsInCart: [Product] = []
    private let service: ProductRepository
    
    init(service: ProductRepository = ProductRepositoryImpl()) {
        self.service = service
        retrieveProducts()
    }
    
    func addProductToCart(_ product: Product) {
        self.productsInCart.append(product)
    }
    
    private func retrieveProducts() {
        service.getProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
