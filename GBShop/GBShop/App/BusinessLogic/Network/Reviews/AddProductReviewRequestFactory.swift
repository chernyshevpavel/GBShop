//
//  AddProuductReviewRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 28.02.2021.
//

import Foundation
import Alamofire

protocol AddProductReviewRequestFactory {
    func create(productId: Int, text: String, token: String, complition: @escaping  (AFDataResponse<JustResult>) -> Void)
}
