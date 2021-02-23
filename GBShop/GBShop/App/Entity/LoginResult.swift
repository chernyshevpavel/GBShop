//
//  LoginResult.swift
//  GBShop
//
//  Created by Павел Чернышев on 21.02.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
    let authToken: String
}
