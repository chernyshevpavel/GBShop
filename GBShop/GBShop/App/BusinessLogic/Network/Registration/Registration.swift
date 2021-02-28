//
//  Auth.swift
//  GBShop
//
//  Created by Павел Чернышев on 21.02.2021.
//

import Foundation

import Alamofire

class Registration: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension Registration: RegistrationRequestFactory {

    func registrate(registrateModel: RegistrationRequestFactoryModel, completionHandler: @escaping (AFDataResponse<UserMessageResult>) -> Void) {
        let requestModel = RegistrationRequest(
            baseUrl: baseUrl,
            userName: registrateModel.userName,
            password: registrateModel.password,
            email: registrateModel.email,
            gender: registrateModel.gender,
            creditCard: registrateModel.creditCard,
            bio: registrateModel.bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension Registration {
    struct RegistrationRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"
        let encoding: RequestRouterEncoding = .json

        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            [
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
