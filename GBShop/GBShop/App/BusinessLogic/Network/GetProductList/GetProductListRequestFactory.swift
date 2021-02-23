//
//  CatalogDataRequestFactory.swift
//  GBShop
//
//  Created by Павел Чернышев on 23.02.2021.
//

import Foundation
import Alamofire

protocol GetProductListRequestFactory {
    func catalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
}
