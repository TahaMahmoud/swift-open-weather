//
//  APIResponse.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

enum APIResponse<T> {

    case onSuccess(T)
    case onFailure(APIError)
}
