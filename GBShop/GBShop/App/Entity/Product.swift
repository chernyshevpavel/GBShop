//
//  Product.swift
//  GBShop
//
//  Created by Павел Чернышев on 23.02.2021.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
            lhs.id == rhs.id &&
                    lhs.name == rhs.name &&
                    lhs.price == rhs.price
        }
}
