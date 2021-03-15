//
//  VersionResponse.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    var main: String
    var icon: String
    
    init(main: String, icon: String) {
        self.main = main
        self.icon = icon
    }
}
