//
//  Codable+Extension.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return nil }
            return dictionary
        } catch {
            return nil
        }
    }
}


