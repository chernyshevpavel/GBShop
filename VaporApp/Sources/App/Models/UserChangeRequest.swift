//
//  File.swift
//  
//
//  Created by Павел Чернышев on 25.02.2021.
//

import Vapor

struct UserChangeRequest: Content {
    var user_id: Int
    var username: String
    var password: String
    var email: String
    var gender: String
    var credit_card: String
    var bio: String
}
