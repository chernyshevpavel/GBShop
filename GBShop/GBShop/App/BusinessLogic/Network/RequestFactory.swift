//
//  RequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 21.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {

    let baseUrl: URL

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    let sessionQueue = DispatchQueue.global(qos: .utility)

    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }

    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeLogoutRequestFacroty() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeRegistrationRequestFacrory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeUserChangeRequestFacrory() -> UserChangeRequestFactory {
        let errorParser = makeErrorParser()
        return UserChange(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeGetProductListRequestFactory() -> GetProductListRequestFactory {
        let errorParser = makeErrorParser()
        return GetProductList(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeGetProductRequestFactory() -> GetProductRequestFactory {
        let errorParser = makeErrorParser()
        return GetProduct(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeProuductReviewsRequestFactory() -> ProductReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return ProductReviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeAddProuductReviewRequestFactory() -> AddProductReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ProductReviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
}
