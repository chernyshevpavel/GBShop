//
//  RegistrationRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 23.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class RegistrationRequestFactoryTest: XCTestCase {

    func testRegistration() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else {
            fatalError("Wrong server url")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "registration")
        let registration = requestFactory.makeRegistrationRequestFacrory()
        registration.registrate(registrateModel: RegistrationRequestFactoryModel(
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        )) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                XCTAssertEqual(login.userMessage, "Регистрация прошла успешно!")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailurRegistration() throws {
        guard let baseUrl = URL(string: "https://failure.url.com") else {
            fatalError("something wrong")
        }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "registration")
        let registration = requestFactory.makeRegistrationRequestFacrory()
        registration.registrate(registrateModel: RegistrationRequestFactoryModel(
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        )) { response in
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
