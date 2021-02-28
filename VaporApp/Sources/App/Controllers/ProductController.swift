//
//  File.swift
//  
//
//  Created by Павел Чернышев on 27.02.2021.
//

import Vapor

class ProductController {
    func getById(_ req: Request) throws -> EventLoopFuture<ProductResponse> {
        guard let query = try? req.query.decode(ProductRequest.self) else {
            throw Abort(.badRequest)
        }
        guard query.product_id == 123 else {
            var abort = Abort(.badRequest)
            abort.reason = "Product not found"
            throw abort
        }
        print(query)
        let response = ProductResponse(result: 1, product_name: "Ноутбук", product_price: 45600, product_description: "Мощный игровой ноутбук")
        return req.eventLoop.future(response)
    }

    
    func list(_ req: Request) throws -> EventLoopFuture<[Product]> {
        guard let query = try? req.query.decode(ProductListRequest.self) else {
            throw Abort(.badRequest)
        }
        print(query)
        var response: [Product] = []
        response.append(Product(id_product: 123, product_name: "Ноутбук", price: 45600))
        response.append(Product(id_product: 456, product_name: "Мышка", price: 1000))
        return req.eventLoop.future(response)
    }
}
