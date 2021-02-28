//
//  AuthRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 23.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class AuthRequestFactoryTest: XCTestCase {

    func testLogin() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else {
            fatalError("Wrong server url")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "logged in")
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                XCTAssertEqual(login.user.name, "John")
                XCTAssertEqual(login.user.login, "geekbrains")
                XCTAssertEqual(login.user.lastname, "Doe")
                XCTAssertEqual(login.user.id, 123)
                XCTAssertEqual(login.authToken, "some_authorizaion_token")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailureLogin() throws {
        guard let baseUrl = URL(string: "failure.url.com") else {
            fatalError("something wrong")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "logged in")
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
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
