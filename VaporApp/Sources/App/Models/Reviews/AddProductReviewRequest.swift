//
//  File.swift
//  
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Vapor

struct AddProductReviewRequest: Content {
    var productId: Int
    var text: String
    var token: String
}

