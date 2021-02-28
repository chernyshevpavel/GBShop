//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 22.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ResponseCodableTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Download https://jsonplaceholder.typicode.com/posts/1")
    var errorParser = ErrorParserStub()

    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShouldDownloadAndParse() {
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success:
                    break
                case .failure(let error):
                    XCTFail(error.errorDescription ?? "")
                }
                self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
