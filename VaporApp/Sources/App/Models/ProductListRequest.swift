//
//  File.swift
//  
//
//  Created by Павел Чернышев on 27.02.2021.
//

import Vapor

struct ProductListRequest: Content {
    var page_number: Int
    var id_category: Int
}
