//
//  File.swift
//  
//
//  Created by Павел Чернышев on 27.02.2021.
//

import Vapor

struct ProductResponse: Content {
    let result: Int
    let product_name: String
    let product_price: Int
    let product_description: String
}
