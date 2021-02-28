//
//  UserChangeRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 22.02.2021.
//

import Foundation
import Alamofire

struct UserChangeRequestFactoryModel {
    var userId: Int
    var userName: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
}

protocol UserChangeRequestFactory {
    func change(
        userChangeModel: UserChangeRequestFactoryModel,
        completionHandler: @escaping (AFDataResponse<JustResult>) -> Void
    )
}
