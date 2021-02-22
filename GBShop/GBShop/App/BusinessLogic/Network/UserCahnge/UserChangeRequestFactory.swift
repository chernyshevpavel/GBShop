//
//  UserChangeRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 22.02.2021.
//

import Foundation
import Alamofire

protocol UserChangeRequestFactory {
    func change(
        userId: Int,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<JustResult>) -> Void)
}
