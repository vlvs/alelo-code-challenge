//
//  ProductRepositoryTest.swift
//  Alelo ChallengeTests
//
//  Created by Vander on 30/05/23.
//

@testable import Alelo_Challenge
import XCTest

final class ProductRepositoryTest: XCTestCase {
    private var subject: ProductRepository!
    private var mockClient: NetworkClientMock!
    
    func test_successfulResponse() {
        let expectation = XCTestExpectation(description: #function)
        
        let expectedNumberOfProducts = 22

        let mockJsonPath = Bundle(for: type(of: self)).path(forResource: "products", ofType: "json")!
        let mockData = try! Data(contentsOf: URL(fileURLWithPath: mockJsonPath))
        subject = ProductRepositoryImpl(client: NetworkClientMock(mockResult: .success(mockData)))
        
        subject.getProducts { result in
            switch result {
            case .success(let products):
                XCTAssertEqual(products[12], .mock)
                XCTAssert(products[4].image.isEmpty)
                XCTAssertEqual(products.count, expectedNumberOfProducts)
            case .failure(let error):
                XCTFail("Error was not expected: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_failureResponse() {
        let expectation = XCTestExpectation(description: #function)
        
        let mockError = NetworkError.requestFailed(NSError())
        subject = ProductRepositoryImpl(client: NetworkClientMock(mockResult: .failure(mockError)))
        
        subject.getProducts { result in
            switch result {
            case .success(_):
                XCTFail("Success response was not expected.")
            case .failure(let error):
                XCTAssertEqual(error, mockError)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
}
