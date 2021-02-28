//
//  ProductReviewsRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Foundation
import Alamofire

protocol ProductReviewsRequestFactory {
    func list(productId: Int, pageNum: Int, complition: @escaping (AFDataResponse<[Review]>) -> Void)
}
