//
//  Fail.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

struct Fail: Codable {
    
    var statusCode: String
    let message: String
}

extension Fail {
    
    enum CodingKeys: String, CodingKey {
        
        case statusCode = "cod"
        case message
    }
}
