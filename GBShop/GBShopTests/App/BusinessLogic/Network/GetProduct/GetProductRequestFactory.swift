//
//  GetProductRequestFactory.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 23.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class GetProductRequestFactory: XCTestCase {

    func testGetProduct() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
        let getProductFactory = requestFactory.makeGetProductRequestFactory()
        let expect = expectation(description: "product")
        getProductFactory.getById(productId: 123) { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model, GetProductResult(result: 1, name: "Ноутбук", price: 45600, description: "Мощный игровой ноутбук"))
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailureGetProduct() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://fake.site.com")!)
        let getProductFactory = requestFactory.makeGetProductRequestFactory()
        let expect = expectation(description: "product")
        getProductFactory.getById(productId: 123) { response in
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
