//
//  Stub.swift
//  GBShopTests
//
//  Created by Павел Чернышев on 22.02.2021.
//

import Foundation
import Alamofire
@testable import GBShop

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        ApiErrorStub.fatalError
    }

    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        error
    }
}
