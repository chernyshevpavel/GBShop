//
//  LogoutRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 23.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class LogoutRequestFactoryTest: XCTestCase {

    func testLogin() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string: "http://127.0.0.1:8080")!)
        let loggedIn = expectation(description: "logout")
        let logout = requestFactory.makeLogoutRequestFacroty();
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                loggedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailurLogin() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://failure.url.com")!)
        let loggedIn = expectation(description: "logout")
        let logout = requestFactory.makeLogoutRequestFacroty();
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let login):
                XCTFail("Must have failed \(login)")
            case .failure:
                loggedIn.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }

}
