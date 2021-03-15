//
//  APIError.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

enum APIErrorType {

    case server
    case noData
    case parsing
    case string
    case network
    case known
}

struct APIError {
    
    var type: APIErrorType
    var code: Int? = 0
    var message: String?
}
