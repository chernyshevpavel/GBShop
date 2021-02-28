//
//  File.swift
//  
//
//  Created by Павел Чернышев on 25.02.2021.
//

import Vapor

class AuthController {
    func register(_ req: Request) throws -> EventLoopFuture<RegisterResponse> {
        guard let body = try? req.content.decode(RegisterRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        let response = RegisterResponse(
            result: 1,
            userMessage: "Регистрация прошла успешно!",
            error_message: nil
        )
        return req.eventLoop.future(response)
    }
    
    func userChange(_ req: Request) throws -> EventLoopFuture<UserChangeResponse> {
        guard let body = try? req.content.decode(UserChangeRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        let response = UserChangeResponse(
            result: 1,
            error_message: nil
        )
        return req.eventLoop.future(response)
    }
    
    func login(_ req: Request) throws -> EventLoopFuture<LoginResponse> {
        guard let logoutReq = try? req.content.decode(LoginRequest.self)  else {
            throw Abort(.badRequest)
        }
        print(logoutReq)
        let response = LoginResponse(result: 1, user: User(id_user: 123, user_login: "geekbrains", user_name: "John", user_lastname: "Doe"), authToken: "some_authorizaion_token")
        return req.eventLoop.future(response)
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<LogoutResponse> {
        guard let logoutReq = try? req.content.decode(LogoutRequest.self)  else {
            throw Abort(.badRequest)
        }
        print(logoutReq)
        let response = LogoutResponse(
            result: 1,
            error_message: nil
        )
        return req.eventLoop.future(response)
    }
}
