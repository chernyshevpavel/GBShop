//
//  ReviewsRequestFactory.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 28.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ProductReviewsRequestFactory: XCTestCase {

    func testGetReviews() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else {
            fatalError("Wrong server url")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let productReviews = requestFactory.makeProuductReviewsRequestFactory()
        let expect = expectation(description: "review list")
        productReviews.list(productId: 123, pageNum: 1) { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model[0].author, "Pavel")
                XCTAssertEqual(model[0].id, 1)
                XCTAssertEqual(model[0].text, "Super good")
                XCTAssertEqual(model[1].author, "Lola")
                XCTAssertEqual(model[1].id, 2)
                XCTAssertEqual(model[1].text, "Better")
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
        let productReviews = requestFactory.makeProuductReviewsRequestFactory()
        let expect = expectation(description: "review list")
        productReviews.list(productId: 123, pageNum: 1) { response in
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
