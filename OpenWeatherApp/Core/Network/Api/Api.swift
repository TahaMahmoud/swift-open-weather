//
//  API.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

/**
 APIConfigurations: Application Modes
 This enum reflict the application modes which can application follow them.
 
 - parameter development: For the application during the development phase.
 - parameter stage: For the application during the testing phase.
 - parameter production: For the application during the launching on the store.
 */

let API = Api(config: .development)

enum APIConfiguration {

    case development
    case stage
    case production
}

final class Api {
    
    let config: APIConfiguration
    
    var baseUrl: String {
        switch config {
        case .development:
            return "http://api.openweathermap.org/data/2.5/"
        case .stage:
            return "http://api.openweathermap.org/data/2.5/"
        case .production:
            return "http://api.openweathermap.org/data/2.5/"
        }
    }
    
    init(config: APIConfiguration) {
        self.config = config
    }
    
    // MARK:- FORECAST
    
    let SERVICE_FORECAST = "forecast"
    let SERVICE_IMAGES = "http://openweathermap.org/img/wn/"
}
