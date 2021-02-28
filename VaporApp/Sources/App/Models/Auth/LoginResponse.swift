//
//  File.swift
//  
//
//  Created by Павел Чернышев on 27.02.2021.
//

import Vapor

struct LoginResponse: Content {
    let result: Int
    let user: User
    let authToken: String
}
