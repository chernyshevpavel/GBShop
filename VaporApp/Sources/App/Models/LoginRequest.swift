//
//  File.swift
//  
//
//  Created by Павел Чернышев on 27.02.2021.
//

import Vapor

struct LoginRequest: Content {
    var username: String
    var password: String
}
