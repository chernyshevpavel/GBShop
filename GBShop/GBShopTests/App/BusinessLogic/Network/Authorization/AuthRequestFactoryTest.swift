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
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
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
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://failure.url.com")!)
        let expect = expectation(description: "logged in")
        let auth = requestFactory.makeAuthRequestFactory();
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
