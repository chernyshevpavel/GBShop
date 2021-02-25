//
//  File.swift
//  
//
//  Created by Павел Чернышев on 25.02.2021.
//
import Vapor

struct RegisterResponse: Content {
    var result: Int
    var user_message: String?
    var error_message: String?
}
