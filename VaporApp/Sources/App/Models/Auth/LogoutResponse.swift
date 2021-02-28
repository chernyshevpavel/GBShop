//
//  File.swift
//  
//
//  Created by Павел Чернышев on 26.02.2021.
//

import Vapor

struct LogoutResponse: Content {
    var result: Int
    var error_message: String?
}
