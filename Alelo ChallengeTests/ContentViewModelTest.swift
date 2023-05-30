//
//  ContentViewModelTest.swift
//  Alelo ChallengeTests
//
//  Created by Vander on 30/05/23.
//

@testable import Alelo_Challenge
import XCTest

@MainActor class ContentViewModelTest: XCTestCase {
    private var subject: ContentViewModel!
    
    @MainActor override func setUp() {
        super.setUp()
        self.subject = ContentViewModel()
    }

    func test_addProductToCart() {
        let initialProductsInCartCount = self.subject.productsInCart.count
        self.subject.addProductToCart(.mock)
        waitUntil(self.subject.$productsInCart, equals: [.mock])
        
        let intermediaryProductsInCartCount = self.subject.productsInCart.count
        XCTAssertNotEqual(initialProductsInCartCount, intermediaryProductsInCartCount)
        XCTAssertEqual(initialProductsInCartCount + 1, intermediaryProductsInCartCount)
        
        self.subject.addProductToCart(.mock)
        waitUntil(self.subject.$productsInCart, equals: [.mock, .mock])
        
        let finalProductsInCartCount = self.subject.productsInCart.count
        XCTAssertNotEqual(initialProductsInCartCount, finalProductsInCartCount)
        XCTAssertNotEqual(intermediaryProductsInCartCount, finalProductsInCartCount)
        XCTAssertEqual(initialProductsInCartCount + 2, finalProductsInCartCount)
    }
}
