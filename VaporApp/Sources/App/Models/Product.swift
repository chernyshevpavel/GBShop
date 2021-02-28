//
//  File.swift
//  
//
//  Created by Павел Чернышев on 27.02.2021.
//

import Vapor

struct Product: Content {
    let id_product: Int
    let product_name: String
    let price: Int
}
