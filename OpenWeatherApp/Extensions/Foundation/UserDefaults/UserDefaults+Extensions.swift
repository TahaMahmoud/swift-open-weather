//
//  UserDefaults+Extensions.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

enum DefaultsKey: String {
    case Language = "appleLanguages"
}

extension UserDefaults {
    
    func store<T: Encodable>(object: T, key: DefaultsKey) throws {
        let jsonData = try JSONEncoder().encode(object)
        set(jsonData, forKey: key.rawValue)
    }
    
    func retrive<T: Decodable>(type: T.Type, key: DefaultsKey) throws -> T? {
        guard let result = value(forKey: key.rawValue) as? Data else { return nil }
        return try JSONDecoder().decode(type, from: result)
    }
    
    func isExist(key: DefaultsKey) -> Bool {
        return object(forKey: key.rawValue) != nil
    }
    
    func delete(key: DefaultsKey) {
        if object(forKey: key.rawValue) != nil {
            removeObject(forKey: key.rawValue)
        }
    }
}
