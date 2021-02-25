//
//  File.swift
//  
//
//  Created by Павел Чернышев on 25.02.2021.
//

import Vapor

struct RegisterRequest: Content {
    var id_user: Int
    var username: String
    var password: String
    var email: String
    var gender: String
    var credit_card: String
    var bio: String
}
