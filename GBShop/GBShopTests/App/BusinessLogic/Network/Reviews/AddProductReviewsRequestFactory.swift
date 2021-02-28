//
//  AddProductReviewsRequestFactory.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 28.02.2021.
//

import XCTest
@testable import GBShop

class AddProductReviewsRequestFactory: XCTestCase {
    func testGetReviews() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else {
            fatalError("Wrong server url")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let productReviews = requestFactory.makeAddProuductReviewRequestFactory()
        let expect = expectation(description: "review add")
        productReviews.create(productId: 123, text: "Best of the best", token: "sometoken") { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailureGetProduct() throws {
        guard let baseUrl = URL(string: "https://failure.url.com") else {
            fatalError("something wrong")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let productReviews = requestFactory.makeAddProuductReviewRequestFactory()
        let expect = expectation(description: "review add")
        productReviews.create(productId: 123, text: "Best of the best", token: "sometoken") { response in
            switch response.result {
            case .success(let model):
                XCTFail("Not expected a model \(model)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }

}
