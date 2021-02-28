//
//  File.swift
//  
//
//  Created by Павел Чернышев on 25.02.2021.
//
import Vapor

struct UserChangeResponse: Content {
    var result: Int
    var error_message: String?
}
