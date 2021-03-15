//
//  City.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

struct City: Codable {
    
    var id: Int
    var name: String
    
    init(_ model: Cities) {
        self.id = Int(model.id)
        self.name = model.name ?? ""
    }
}
