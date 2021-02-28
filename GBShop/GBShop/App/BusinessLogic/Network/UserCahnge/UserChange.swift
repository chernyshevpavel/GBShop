//
//  UserChange.swift
//  GBShop
//
//  Created by Павел Чернышев on 22.02.2021.
//

import Foundation

import Alamofire

class UserChange: AbstractRequestFactory {
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

extension UserChange: UserChangeRequestFactory {
    func change(userChangeModel: UserChangeRequestFactoryModel, completionHandler: @escaping (AFDataResponse<JustResult>) -> Void) {
        let requestModel = UserChangeRequest(
            baseUrl: baseUrl,
            userId: userChangeModel.userId,
            userName: userChangeModel.userName,
            password: userChangeModel.password,
            email: userChangeModel.email,
            gender: userChangeModel.gender,
            creditCard: userChangeModel.creditCard,
            bio: userChangeModel.bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension UserChange {
    struct UserChangeRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "userChange"

        let userId: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            [
                "user_id": userId,
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
