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
        baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension UserChange: UserChangeRequestFactory{
    func change(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<JustResult>) -> Void) {
        let requestModel = UserChangeRequest(baseUrl: baseUrl, userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension UserChange {
    struct UserChangeRequest: RequestRouter{
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
            return [
                "user_id": userId,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio,
            ]
        }
    }
}

