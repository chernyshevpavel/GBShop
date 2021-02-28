//
//  File.swift
//  
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Vapor

struct StandartResponse: Content {
    var result: Int
    var userMessage: String?
    var error_message: String?
}
