//
//  ProductRewiews.swift
//  GBShop
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Foundation
import Alamofire

class ProductReviews: AbstractRequestFactory {
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

extension ProductReviews: ProductReviewsRequestFactory {
    func list(productId: Int, pageNum: Int, complition: @escaping (AFDataResponse<[Review]>) -> Void) {
        let requestModel = ProductReviewsRequest(
            baseUrl: baseUrl,
            productId: productId,
            pageNum: pageNum
        )
        request(request: requestModel, completionHandler: complition)
    }
}

extension ProductReviews: AddProductReviewRequestFactory {
    func create(productId: Int, text: String, token: String, complition: @escaping (AFDataResponse<JustResult>) -> Void) {
        let requestModel = AddProductReviewRequest(baseUrl: baseUrl, productId: productId, text: text, token: token)
        request(request: requestModel, completionHandler: complition)
    }
}

extension ProductReviews {
    struct ProductReviewsRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getProductReviews"

        var productId: Int
        var pageNum: Int

        var parameters: Parameters? {
            [
                "productId": productId,
                "pageNum": pageNum
            ]
        }
    }

    struct AddProductReviewRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "addProductReview"

        var productId: Int
        var text: String
        var token: String

        var parameters: Parameters? {
            [
                "productId": productId,
                "text": text,
                "token": token
            ]
        }
    }
}
