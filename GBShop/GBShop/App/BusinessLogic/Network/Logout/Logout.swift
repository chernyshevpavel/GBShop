//
//  Auth.swift
//  GBShop
//
//  Created by Павел Чернышев on 21.02.2021.
//

import Foundation

import Alamofire

class Logout: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Logout: LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<JustResult>) -> Void) {
        let requestModel = LogoutRequest(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct LogoutRequest: RequestRouter{
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let userId: Int
        var parameters: Parameters? {
            return [
                "user_id": userId
            ]
        }
    }
}
