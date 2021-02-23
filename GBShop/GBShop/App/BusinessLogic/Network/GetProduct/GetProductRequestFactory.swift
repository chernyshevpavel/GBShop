//
//  GetProductRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 23.02.2021.
//

import Foundation
import Alamofire

protocol GetProductRequestFactory {
    func getById(productId: Int, complition: @escaping (AFDataResponse<GetProductResult>) -> Void)
}
