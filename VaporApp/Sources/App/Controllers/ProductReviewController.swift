//
//  File.swift
//  
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Vapor

class ProductReviewController {
    func list(_ req: Request) throws -> EventLoopFuture<[Review]> {
        guard let query = try? req.query.decode(ProductReviewsRequest.self) else {
            throw Abort(.badRequest)
        }
        print(query)
        var response: [Review] = []
        response.append(Review(id: 1, author: "Pavel", text: "Super good"))
        response.append(Review(id: 2, author: "Lola", text: "Better"))
        return req.eventLoop.future(response)
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<StandartResponse> {
        guard let body = try? req.content.decode(AddProductReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        let response = StandartResponse(
            result: 1,
            error_message: nil
        )
        return req.eventLoop.future(response)
    }
}

