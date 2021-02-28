//
//  CatalogDataRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 23.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class GetProductListRequestFactoryTest: XCTestCase {

    func testGetProductList() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else {
            fatalError("Wrong server url")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let catalogData = requestFactory.makeGetProductListRequestFactory()
        let expect = expectation(description: "product list")
        catalogData.catalogData(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model[0], Product(id: 123, name: "Ноутбук", price: 45600))
                XCTAssertEqual(model[1], Product(id: 456, name: "Мышка", price: 1000))
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailureGetProductList() throws {
        guard let baseUrl = URL(string: "https://failure.url.com") else {
            fatalError("something wrong")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let catalogData = requestFactory.makeGetProductListRequestFactory()
        let expect = expectation(description: "product list")
        catalogData.catalogData(pageNumber: 1, idCategory: 1) { response in
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
