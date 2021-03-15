//
//  URLComponents+Extension.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

extension URLComponents {
    
    init(service: ServiceProtocol) {
        let urlString = API.baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let baseUrl = URL(string: urlString)
        let url = baseUrl!.appendingPathComponent(service.path)
        
        /// Build the URL
        
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        /// Set the spasific guery params which assigned by routes
        
        guard let parameters = service.parameters else { return }
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
