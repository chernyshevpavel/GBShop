//
//  CatalogData.swift
//  GBShop
//
//  Created by Павел Чернышев on 23.02.2021.
//

import Foundation
import Alamofire

class GetProductList: AbstractRequestFactory {
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

extension GetProductList: GetProductListRequestFactory {
    func catalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = GetProductListRequest(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetProductList {
    struct GetProductListRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getProductList"
        var pageNumber: Int
        var idCategory: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ];
        }
    }
}
