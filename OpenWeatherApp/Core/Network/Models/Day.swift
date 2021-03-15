//
//  SignForm.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

struct Day: Codable {
    
    var dt: Int
    var weather: [Weather]
    var dtTxt: String
    
    init(_ model: Days) {
        self.dt = Int(model.dt)
        self.dtTxt = model.dtTxt ?? ""
        self.weather = [Weather(main: model.main ?? "", icon: model.icon ?? "")]
    }
}

extension Day {
    
    enum CodingKeys: String, CodingKey {
        
        case dt
        case weather
        case dtTxt = "dt_txt"
    }
}
