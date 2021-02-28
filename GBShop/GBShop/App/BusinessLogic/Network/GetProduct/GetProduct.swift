//
//  GetProduct.swift
//  GBShop
//
//  Created by Павел Чернышев on 23.02.2021.
//

import Foundation
import Alamofire

class GetProduct: AbstractRequestFactory {
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

extension GetProduct: GetProductRequestFactory {
    func getById(productId: Int, complition: @escaping (AFDataResponse<GetProductResult>) -> Void) {
        let requestModel = GetProductRequest(baseUrl: baseUrl, productId: productId)
        request(request: requestModel, completionHandler: complition)
    }
    
}

extension GetProduct {
    struct GetProductRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getProductById"
        var productId: Int
        
        var parameters: Parameters? {
            return [
                "product_id": productId
            ]
        }
        
        
    }
}
