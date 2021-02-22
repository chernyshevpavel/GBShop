//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 21.02.2021.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<JustResult>) -> Void)
}
