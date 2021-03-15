//
//  ServiceProtocol.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

typealias Headers = [String : String]
typealias Parameters = [String : Any]

protocol ServiceProtocol {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: Headers? { get }
    var body: Any? { get }
}
