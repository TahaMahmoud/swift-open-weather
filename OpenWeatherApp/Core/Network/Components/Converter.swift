//
//  Codable+Extension.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

class Converter {
    
    static func toData(_ object: Any) -> Data {
        var jsonData: Data!
        if (object is String) {
            jsonData = (object as! String).data(using: .utf8)!
        } else {
            do {
                jsonData = try JSONSerialization.data(withJSONObject: object, options: [])
            } catch _ as NSError {
            } catch {
            }
        }
        return jsonData
    }
}

