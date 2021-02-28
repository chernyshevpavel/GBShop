//
//  File.swift
//  
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Vapor

struct Review: Content {
    var id: Int
    var author: String
    var text: String
}

