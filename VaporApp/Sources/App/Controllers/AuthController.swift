//
//  File.swift
//  
//
//  Created by Павел Чернышев on 25.02.2021.
//

import Vapor

class AuthController {
    func register(_ req: Request) throws -> EventLoopFuture<RegisterResponse> {
        print(req.method)
        guard let body = try? req.content.decode(RegisterRequest.self) else {
            print(req)
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = RegisterResponse(
            result: 1,
            user_message: "Регистрация прошла успешно!",
            error_message: nil
        )
        
        return req.eventLoop.future(response)
    }
}
