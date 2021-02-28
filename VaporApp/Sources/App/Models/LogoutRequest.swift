//
//  File.swift
//  
//
//  Created by Павел Чернышев on 26.02.2021.
//
import Vapor

struct LogoutRequest: Content {
    var user_id: Int
}
