//
//  GetProductResult.swift
//  GBShop
//
//  Created by Павел Чернышев on 23.02.2021.
//

import Foundation

struct GetProductResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}

extension GetProductResult: Equatable {
    static func == (lhs: GetProductResult, rhs: GetProductResult) -> Bool {
            lhs.result == rhs.result &&
                    lhs.name == rhs.name &&
                    lhs.price == rhs.price &&
                    lhs.description == rhs.description
        }
}
