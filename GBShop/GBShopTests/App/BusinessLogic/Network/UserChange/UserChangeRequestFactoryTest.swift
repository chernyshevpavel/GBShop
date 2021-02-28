//
//  UserChangeRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 23.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class UserChangeRequestFactoryTest: XCTestCase {

    func testUserChange() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string: "http://127.0.0.1:8080")!)
        let expect = expectation(description: "user change")
        let userChange = requestFactory.makeUserChangeRequestFacrory();
        userChange.change(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailurUserChange() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://failure.url.com")!)
        let expect = expectation(description: "user change")
        let userChange = requestFactory.makeUserChangeRequestFacrory();
        userChange.change(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let login):
                XCTFail("Must have failed \(login)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
}
