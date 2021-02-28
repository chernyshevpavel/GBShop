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
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else {
            fatalError("Wrong server url")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
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
        guard let baseUrl = URL(string: "https://failure.url.com") else {
            fatalError("something wrong")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
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
