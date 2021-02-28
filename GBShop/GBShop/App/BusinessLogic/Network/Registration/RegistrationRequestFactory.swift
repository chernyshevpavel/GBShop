//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 22.02.2021.
//

import Foundation
import Alamofire

struct RegistrationRequestFactoryModel {
    var userName: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
}

protocol RegistrationRequestFactory {
    func registrate(
        registrateModel: RegistrationRequestFactoryModel,
        completionHandler: @escaping (AFDataResponse<UserMessageResult>) -> Void
    )
}
