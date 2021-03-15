//
//  ForecastService.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

extension Api {
    
    enum Forecast: ServiceProtocol {
        
        case search(cityName: String, apiKey: String = Constants.openWeatherApiKey)
        
        var path: String {
            switch self {
            case .search:
                return API.SERVICE_FORECAST
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .search:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case let .search(cityName, apiKey):
                return [
                    "q": cityName,
                    "appid": apiKey
                ]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .search:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .search:
                return nil
            }
        }
    }
}
