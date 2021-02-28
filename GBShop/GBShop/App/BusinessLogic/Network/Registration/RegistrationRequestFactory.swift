//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 22.02.2021.
//

import Foundation
import Alamofire

protocol RegistrationRequestFactory {
    func registrate(
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<UserMessageResult>) -> Void)
}



