//
//  Product.swift
//  Alelo Challenge
//
//  Created by Vander on 29/05/23.
//

import SwiftUI

struct Product: Decodable {
    let name: String
    let onSale: Bool
    let regularPrice: String
    let actualPrice: String
    let installments: String
    let image: URL?
    let sizes: [Size]
}
