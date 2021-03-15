//
//  APIData.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

/// The generic response for current API

struct APIData<T: Decodable>: Decodable {
    
    var statusCode: String
    var message: Int
    var list: T?
    var city: City
}

extension APIData {
    
    enum CodingKeys: String, CodingKey {
        
        case statusCode = "cod"
        case message
        case list
        case city
    }
}
