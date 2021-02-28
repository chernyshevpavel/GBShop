//
//  File.swift
//  
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Vapor

struct ProductReviewsRequest: Content {
    var productId: Int
    var pageNum: Int = 1
}
